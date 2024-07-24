part of '../presentation/login.dart';

abstract class LoginController extends State<Login> {

// SET USER TEXT CONTROLLERS
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

// USER LOGIN FUNCTION
  Future<void> loginUser() async {
    // CHECK ALL FIELDS ARE BEING USED
    if (userController.text.isEmpty || passwordController.text.isEmpty) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Error"),
            content: Text("Please fill in all fields."),
          ),
        );
      }
      return;
    }

    try {
      var userToLog =
          await widget.client.usersRegistry.getUserByName(userController.text);

      if (userToLog == null) {
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text("Error"),
              content: Text("User doesn't exist. Try registering a new user."),
            ),
          );
        }
        return;
      }

      var response = await widget.client.usersRegistry.login(userController.text, passwordController.text);

      // CHECK IF THE PASSWORD IS CORRECT
      //bool isValid = await widget.client.usersRegistry.validatePassword(passwordController.text, userToLog.userPassword);
      if (response.success) {
        await welcomeUser(userToLog.id!);
      } else {
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text("Error"),
              content: Text("Password is incorrect. Please try again."),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Error"),
            content: Text("Failed to login: $e"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

// RETURNS THE USER FROM SELECTED ID
  Future<void> welcomeUser(int userId) async {
    // TRY - CATCH BLOCK FOR HANDLE ERRORS
    try {
      // FETCH USER BY ID
      var user = await widget.client.usersRegistry.getUserById(userId);

      // CHECK IF THE WIDGET IS STILL MOUNTED BEFORE PROCEEDING
      if (!mounted) return;

      // DISPLAY THE APPROPRIATE DIALOG BASED ON THE RESULT

      // USER NOT FOUND
      if (user == null) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("User"),
            content: Text("User not found."),
          ),
        );
      }

      // USER FOUND, WELCOME MESSAGE AND ENTERS INTO TODOLIST
      else {
        BasicArguments args = BasicArguments(client: widget.client, user: user);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("User"),
            content: Text("Welcome ${user.userName}"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, AppRoutes.home, arguments: args);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Error"),
            content: Text("Failed to get user information: $e"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }
}
