part of '../presentation/register.dart';

abstract class RegisterController extends State<Register> {
// SET USER TEXT CONTROLLERS
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

// USER REGISTRY FUNCTION
  Future<void> registryUser() async {
    // CALLS FOR A FUNCTION THAT VALIDATES INPUTS.
    if (!validateInputs()) return;

    // CALLS FOR A FUNCTION THAT VALIDATES USER EXISTANCE
    bool userExists = await checkUserExistance();
    if (userExists) return;

    // TO DO - LET USER DECIDE IT IN FRONTEND
    // DEFINE DEFAULT PASSWORD OPTIONS
    // ALL EXCEPT automatedPassword ARE NULLABLE
    PasswordOptions selectedOptions = PasswordOptions(
      automatedPassword: false,
      passwordLengthOption: null, // DEFINE A DEFAULT VALUE FOR PASSWORD LENGHT
      upperOption: null, // REQUIRES AT LEAST ONE UPPERCASE LETTER
      numberOption: null, // REQUIRES AT LEAST ONE NUMBER
      specialOption: null,
    ); // REQUIRES AT LEAST ONE SPECIAL CHARACTER

    // TRY - CATCH BLOCK FOR HANDLE ERRORS
    try {
      // CREATES NEW USER
      await createUser(selectedOptions);

      // GET AUTHENTICATION
      await getAuth();
    } catch (e) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Error"),
            content: Text("Failed to register user: $e"),
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
      // TODO - CHECK BETTER THAN THIS
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
        UserInfo? userInfo =
            await widget.client.usersRegistry.getUserInfoById(user.id!);

        // CHECK IF THE WIDGET IS STILL MOUNTED BEFORE PROCEEDING
        if (!mounted) return;

        HomeArgs args =
            HomeArgs(client: widget.client, user: user, userInfo: userInfo!);
        showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(
            customTitle: "Succesful Register",
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
            customContent: ("Failed to get user information: $e"),
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

// CHECK IF INPUTS ARE CORRECT.
  bool validateInputs() {
    bool areValid = true;
    // CHECK ALL FIELDS ARE BEING USED
    if (userController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmController.text.isEmpty) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Error"),
            content: Text("Please fill in all fields."),
          ),
        );
      }
      areValid = false;
      return areValid;
    }

    // CHECK IF PASSWORD FIELDS MATCH
    if (passwordController.text != confirmController.text) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => const CustomAlertDialog(
            customTitle: "Error",
            customContent: "Passwords do not match.",
          ),
        );
      }
      areValid = false;
      return areValid;
    }
    if (!checkPassword(passwordController.text)) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => const CustomAlertDialog(
              customTitle: "Password Error",
              customContent:
                  "Minimum eight characters, at least one letter and one number"),
        );
      }
      areValid = false;
    }

    return areValid;
  }

  bool checkPassword(String password) {
    RegExp exp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    return exp.hasMatch(password);
  }

// CHECK IF USER ALREADY EXISTS. IF IT DOES IT RETURNS A DIALOG.
  Future<bool> checkUserExistance() async {
    // CHECK IF THE USER ALREADY EXISTS IN THE DB
    bool userExists = await widget.client.usersRegistry
        .checkUserExistanceByName(userController.text);
    if (userExists) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => const CustomAlertDialog(
            customTitle: "Error",
            customContent: "User already exists.",
          ),
        );
      }
    }
    return userExists;
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
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const CustomAlertDialog(
                customTitle: ("An error ocurred"),
                customContent: ("Something happen try to log in."),
              );
            });
      }
    }
  }

  // CREATE A NEW USERREGISTRY
  Future<UsersRegistry> createUser(PasswordOptions options) async {
    // CREATE PASSWORD OPTIONS IN THE DB
    await widget.client.passwordOptions.createOptions(options);

    // GET THE LATEST PASSWORD OPTIONS GENERATED TO RETRIEVE ITS ID
    var lastOptionsGenerated = await widget.client.passwordOptions.getLastID();

    // CREATE THE USER IN THE DB
    var generatedUser = await widget.client.usersRegistry.createUser(
      userController.text,
      lastOptionsGenerated!,
      selectedUserPassword: passwordController.text,
    );
    return generatedUser;
  }
}
