part of '../presentation/register_screen.dart';

abstract class RegisterController extends State<RegisterScreen>  
{

// SET USER TEXT CONTROLLERS
TextEditingController userController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmController = TextEditingController();

// USER REGISTRY FUNCTION
Future<void> registryUser() async 
{

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
    return;
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
    return;
  }

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
    // CREATE PASSWORD OPTIONS IN THE DB
    await widget.client.passwordOptions.createOptions(selectedOptions);

    // GET THE LATEST PASSWORD OPTIONS GENERATED TO RETRIEVE ITS ID
    var lastOptionsGenerated = await widget.client.passwordOptions.getLastID();

    // CREATE THE USER IN THE DB
    var generatedUser = await widget.client.usersRegistry.createUser( userController.text,
                                                                      lastOptionsGenerated!,
                                                                      selectedUserPassword: passwordController.text, );

    // SEE CREATED USER
    await welcomeUser(generatedUser.id!);
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
Future<void> welcomeUser(int userId) async 
{
  // TRY - CATCH BLOCK FOR HANDLE ERRORS
  try
  {
    // FETCH USER BY ID
    var user = await widget.client.usersRegistry.getUserById(userId); 

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
                                                     actions: [ TextButton( onPressed: () => Navigator.pushNamed(context, AppRoutes.todoList, arguments: args),
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


}