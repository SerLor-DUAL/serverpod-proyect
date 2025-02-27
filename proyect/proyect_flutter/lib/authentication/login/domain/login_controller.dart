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
        await showDialog(
            context: context,
            builder: (BuildContext context) {
              return const CustomAlertDialog(
                customTitle: "Empty Fields",
                customContent: "Fill all fields to login!",
              );
            });
      }
      return;
    }

    try {
      await getAuth();
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
  Future<void> welcomeUser(String userName) async {
    // TRY - CATCH BLOCK FOR HANDLE ERRORS
    try {
      // FETCH USER BY ID
      var user = await widget.client.usersRegistry.getUserByName(userName);

      // CHECK IF THE WIDGET IS STILL MOUNTED BEFORE PROCEEDING
      if (!mounted) return;

      // DISPLAY THE APPROPRIATE DIALOG BASED ON THE RESULT

      // USER NOT FOUND
      if (user == null) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const CustomAlertDialog(
                customTitle: ("User Not Found"),
                customContent:
                    ("User doesn't exist. Try registering a new user."),
              );
            });
      }

      // USER FOUND, WELCOME MESSAGE AND ENTERS INTO TODOLIST
      else {
        UserInfo? userInfo = await widget.client.usersRegistry.getUserInfoById(user.id!);
        
        // CHECK IF THE WIDGET IS STILL MOUNTED BEFORE PROCEEDING
        if (!mounted) return;
        
        HomeArgs args = HomeArgs(client: widget.client, user: user, userInfo: userInfo!);
        showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(
            customTitle: "Succesfull Login!",
            customContent: "Welcome ${user.userName}",
            customActions: [
              ElevatedButton(
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
          builder: (context) => CustomAlertDialog(
            customTitle: "Error",
            customContent: "Failed to get user information: $e",
            customActions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  // ASK FOR VALIDATION TO USERSREGISTRY ENDPOINT. IF IT IS CORRECT. 
  // IT STORES THE TOKEN GENERATED INTO SESSIONMANAGER INSTANCE
  Future<void> getAuth() async {
    var response = await widget.client.usersRegistry
        .login(userController.text, passwordController.text);

    // CHECK IF THE PASSWORD IS CORRECT
    //bool isValid = await widget.client.usersRegistry.validatePassword(passwordController.text, userToLog.userPassword);
    if (response.success) {
      // STORE THE USER INFO IN THE SESSION MANAGER.
      SessionManager sessionManager = await SessionManager.instance;
      await sessionManager.registerSignedInUser(
        response.userInfo!,
        response.keyId!,
        response.key!,
      );
      
      // GIVES THE WELCOME TO THE USER.
      await welcomeUser(userController.text);
    } else {
      if (mounted) {
        // TODO: CHANGE AUTH MESSAGE. It should detect that password was incorrect or that user doesn't exists.
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const CustomAlertDialog(
                customTitle: ("Incorrect Password"),
                customContent: ("Password is incorrect. Please try again."),
              );
            });
      }
    }
  }
  
}
