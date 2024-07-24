part of '../presentation/register.dart';

abstract class RegisterController extends State<Register>  
{

// SET USER TEXT CONTROLLERS
TextEditingController userController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmController = TextEditingController();

// USER REGISTRY FUNCTION
Future<void> registryUser() async 
{
  // CALLS FOR A FUNCTION THAT VALIDATES INPUTS.
  if (!validateInputs()){
    return;
  }

  // CALLS FOR A FUNCTION THAT VALIDATES USER EXISTANCE
  bool userExists = await checkUserExistance();
  if (userExists) {
    return;
  }

  // TO DO - LET USER DECIDE IT IN FRONTEND 
  // DEFINE DEFAULT PASSWORD OPTIONS 
  // ALL EXCEPT automatedPassword ARE NULLABLE
  PasswordOptions selectedOptions = PasswordOptions( automatedPassword: false,
                                                     passwordLengthOption: null,     // DEFINE A DEFAULT VALUE FOR PASSWORD LENGHT
                                                     upperOption: null,              // REQUIRES AT LEAST ONE UPPERCASE LETTER
                                                     numberOption: null,             // REQUIRES AT LEAST ONE NUMBER
                                                     specialOption: null, );          // REQUIRES AT LEAST ONE SPECIAL CHARACTER
 
  // TRY - CATCH BLOCK FOR HANDLE ERRORS
  try 
  {
    // CREATES NEW USER
    await createUser(selectedOptions);

    // GET AUTHENTICATION
    await getAuth();
  } 
  catch (e) 
  {
    if (mounted) 
    {
      showDialog( context: context,
                  builder: (context) => AlertDialog( title: const Text("Error"),
                                                     content: Text("Failed to register user: $e"),
                                                     actions: [ TextButton( onPressed: () => Navigator.of(context).pop(),
                                                                            child: const Text('OK'), 
                                                                            
            ),
          ],
        ),
      );
    }
  }
}

// RETURNS THE USER FROM SELECTED ID
Future<void> welcomeUser(String userName) async 
{
  // TRY - CATCH BLOCK FOR HANDLE ERRORS
  try
  {
    // FETCH USER BY ID
    var user = await widget.client.usersRegistry.getUserByName(userName); 

    // CHECK IF THE WIDGET IS STILL MOUNTED BEFORE PROCEEDING
    if (!mounted) return;

    // DISPLAY THE APPROPRIATE DIALOG BASED ON THE RESULT

    // USER NOT FOUND
    if (user == null) 
    {
      showDialog( context: context,
                  builder: (context) => const AlertDialog( title: Text("User"),
                                                           content: Text("User not found."),
        ),
      );
    } 

    // USER FOUND, WELCOME MESSAGE AND ENTERS INTO TODOLIST
    else {
      // Navigator.pushNamed(context, '/todolist', arguments: user.id) will give arguments that the routing will call.
      // Go to main to see were they are applied.
      BasicArguments args = BasicArguments(client: widget.client, user: user);
      showDialog( context: context,
                  builder: (context) => AlertDialog( title: const Text("User"),
                                                     content: Text("Welcome ${user.userName}"),
                                                     actions: [ TextButton( onPressed: () => Navigator.pushNamed(context, AppRoutes.home, arguments: args),
                                                                            child: const Text('OK'), 
            ),
          ],
        ),
      );
    }
  } 
  catch (e) 
  {
    if (mounted) 
    {
      showDialog( context: context,
                  builder: (context) => AlertDialog( title: const Text("Error"),
                                                     content: Text("Failed to get user information: $e"),
                                                     actions: [ TextButton( onPressed: () => Navigator.of(context).pop(),
                                                                            child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}

// CHECK IF INPUTS ARE CORRECT.
bool validateInputs(){
  bool areValid = true;
   // CHECK ALL FIELDS ARE BEING USED
  if (userController.text.isEmpty || passwordController.text.isEmpty || confirmController.text.isEmpty) 
  {
    if (mounted) 
    {
      showDialog( context: context,
                  builder: (context) => const AlertDialog( title: Text("Error"),
                                                           content: Text("Please fill in all fields."),
        ),
      );
    }
    areValid = false;
    return areValid;
  }

  // CHECK IF PASSWORD FIELDS MATCH
  if (passwordController.text != confirmController.text) 
  {
    if (mounted) 
    {
      showDialog( context: context,
                  builder: (context) => const AlertDialog( title: Text("Error"),
                                                           content: Text("Passwords do not match."),
        ),
      );
    }
    areValid = false;
    return areValid;
  }
  return areValid;
}
// CHECK IF USER ALREADY EXISTS. IF IT DOES IT RETURNS A DIALOG.
Future<bool> checkUserExistance() async{

  // CHECK IF THE USER ALREADY EXISTS IN THE DB
  bool userExists = await widget.client.usersRegistry.checkUserExistanceByName(userController.text);
  if (userExists) 
  {
    if (mounted) 
    {
      showDialog( context: context,
                  builder: (context) => const AlertDialog( title: Text("Error"),
                                                          content: Text("User already exists."),
        ),
      );
    }
  }
  return userExists;
}

// Ask for validation to usersRegistry endpoint. If it is correct. It stores the token generated into
  // sessionManager instance
  Future<void> getAuth() async {

    var response = await widget.client.usersRegistry
        .login(userController.text, passwordController.text);

    // CHECK IF THE PASSWORD IS CORRECT
    //bool isValid = await widget.client.usersRegistry.validatePassword(passwordController.text, userToLog.userPassword);
    if (response.success) {
      // Store the user info in the session manager.
      SessionManager sessionManager = await SessionManager.instance;
      await sessionManager.registerSignedInUser(
        response.userInfo!,
        response.keyId!,
        response.key!,
      );
      // Gives the welcome to the user.
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
  // Create a new UserRegistry
  Future<UsersRegistry> createUser(PasswordOptions options) async{
    // CREATE PASSWORD OPTIONS IN THE DB
    await widget.client.passwordOptions.createOptions(options);

    // GET THE LATEST PASSWORD OPTIONS GENERATED TO RETRIEVE ITS ID
    var lastOptionsGenerated = await widget.client.passwordOptions.getLastID();

    // CREATE THE USER IN THE DB
    var generatedUser = await widget.client.usersRegistry.createUser( userController.text,
                                                                      lastOptionsGenerated!,
                                                                      selectedUserPassword: passwordController.text, );
    return generatedUser;

  }



}
