
import 'package:flutter/material.dart';
import 'package:proyect_client/proyect_client.dart';

class Register extends StatefulWidget {
  final Client client;
  const Register({super.key, required this.client});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> 
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
      showDialog( context: context,
                  builder: (context) => AlertDialog( title: const Text("User"),
                                                     content: Text("Welcome ${user.userName}"),
                                                     actions: [ TextButton( onPressed: () => Navigator.pushNamed(context, '/todolist', arguments: user.id),
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

// ----------------------- FLUTTER ------------------------------ //

  @override
  Widget build(BuildContext context) 
  {
    // GETS SCREEN SIZING
    Size screenSize = MediaQuery.of(context).size;

    // CALCULATE RESPONSIVE DIMENSION
    double columnWidth = screenSize.width * 0.35;

    return Scaffold(
      
      // MAIN CONTAINER
      body: Container(
        color: const Color.fromARGB(255, 124, 214, 255),

        // MAIN ROW
        child: Row(
        
          // ELEMENTS FROM THE MAIN ROW
          children: [
        
            // LEFT COLUMN IN THE MAIN ROW
            Expanded(
              flex: 1, // GETS HALF SCREEN
        
              // LAYOUT FOR ELEMENTS INSIDE THIS COLUMN
              child: 
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        
                // COLUMN WHERE ELEMENTS OF THE CONTAINER WILL BE PLACED
                child: 
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
                      // LOGO TITLE TEXT, TEXTFIELDS AND ROW WHERE BUTTONS ARE PLACED
                      children: [
                        
                        // LOGO TITLE TEXT
                        RichText(
                          text: const TextSpan( text: 'IntegraQS',
                                                style: TextStyle( fontSize: 80.0,
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.w800,
                                                                  shadows: 
                                                                    <Shadow> [
                                                                      Shadow( offset: Offset(1, 1),
                                                                              blurRadius: 1.0,
                                                                              color: Color.fromARGB(255, 54, 157, 216),
                                                                      ),
                                                                      Shadow( offset: Offset(2, 2),
                                                                              blurRadius: 2.0,
                                                                              color: Color.fromARGB(255, 54, 157, 216),
                                                                      ),
                                                                      Shadow( offset: Offset(3, 3),
                                                                              blurRadius: 3.0,
                                                                              color: Color.fromARGB(255, 54, 157, 216),
                                                                      ),
                                                                    ],
                                                        ),
                                        ),
                        ),
            
                        const SizedBox(height: 100.0),
      
                        // TEXTBOXES
                        SizedBox (
                          width: columnWidth,
                          child: 
                            Column(
                              children: [
                                // USERNAME TEXTFIELD
                                TextField(
                                  controller: userController,
                                  decoration: const InputDecoration( enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Color.fromARGB(255, 54, 157, 216),
                                                                                                                               width: 2,
                                                                                                                    ),
                                                                              ),
                                                                      hintText: "Username",
                                                                      hintStyle: TextStyle( color: Color.fromARGB(255, 54, 157, 216)                   
                                                                                 ),
                                                                      filled: true,
                                                                      fillColor: Colors.white,
                                                                      focusColor: Colors.white,
                                                                      focusedBorder: OutlineInputBorder( borderSide: BorderSide(color: Color.fromARGB(255, 54, 157, 216),
                                                                                                                               width: 2,
                                                                                                                     ),
                                                                                     ), 
                                                    ),  
                                  style: const TextStyle( color: Color.fromARGB(255, 54, 157, 216),
                                                          fontWeight: FontWeight.bold,   
                                                ),
                                  cursorColor: const Color.fromARGB(255, 54, 157, 216),
                                ),
      
                                const SizedBox(height: 20.0),
      
                                // PASSWORD TEXTFIELD
                                TextField(
                                  controller: passwordController,
                                  decoration: const InputDecoration( enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Color.fromARGB(255, 54, 157, 216),
                                                                                                                               width: 2,
                                                                                                                    ),
                                                                              ),
                                                                      hintText: "Password",
                                                                      hintStyle: TextStyle( color: Color.fromARGB(255, 54, 157, 216)                   
                                                                                 ),
                                                                      filled: true,
                                                                      fillColor: Colors.white,
                                                                      focusColor: Colors.white,
                                                                      focusedBorder: OutlineInputBorder( borderSide: BorderSide(color: Color.fromARGB(255, 54, 157, 216),
                                                                                                                               width: 2,
                                                                                                                     ),
                                                                                     ), 
                                                    ),  
                                  style: const TextStyle( color: Color.fromARGB(255, 54, 157, 216),
                                                          fontWeight: FontWeight.bold,   
                                                ),
                                  cursorColor: const Color.fromARGB(255, 54, 157, 216),
                                ),
      
                                const SizedBox(height: 20.0),
      
                                // CONFIRM PASSWORD TEXTFIELD
                                TextField(
                                  controller: confirmController,
                                  decoration: const InputDecoration( enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Color.fromARGB(255, 54, 157, 216),
                                                                                                                               width: 2,
                                                                                                                    ),
                                                                              ),
                                                                      hintText: "Confirm Password",
                                                                      hintStyle: TextStyle( color: Color.fromARGB(255, 54, 157, 216)                   
                                                                                 ),
                                                                      filled: true,
                                                                      fillColor: Colors.white,
                                                                      focusColor: Colors.white,
                                                                      focusedBorder: OutlineInputBorder( borderSide: BorderSide(color: Color.fromARGB(255, 54, 157, 216),
                                                                                                                               width: 2,
                                                                                                                     ),
                                                                                     ), 
                                                    ),  
                                  style: const TextStyle( color: Color.fromARGB(255, 54, 157, 216),
                                                          fontWeight: FontWeight.bold,   
                                                ),
                                  cursorColor: const Color.fromARGB(255, 54, 157, 216),
                                ),
      
                                const SizedBox(height: 50.0),
                              ],
                            ),
                        ),
      
                        // ROW WITH LOGIN AND REGISTER BUTTONS
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
      
                          children: [
      
                            // LOGIN BUTTON
                            ElevatedButton(
                              onPressed: () { Navigator.pop(context); }, // RETURNS TO MAIN NAVIGATION MENU
                              style: ElevatedButton.styleFrom( textStyle: const TextStyle(fontSize: 30.0), 
                                                                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 115.0),
                                                                backgroundColor: Colors.white,
                                                                foregroundColor: const Color.fromARGB(255, 54, 157, 216),
                                                                shadowColor: const Color.fromARGB(255, 54, 157, 216),
                                                                elevation: 3,
                                                                shape: const ContinuousRectangleBorder(side: BorderSide( color: Color.fromARGB(255, 54, 157, 216),
                                                                                                                         width: 2,
                                                                                                            ),
                                                                            ),
                                      ),
                              child: const Text("Login"),
                            ),
      
      
                            const SizedBox(width: 30),
      
                            // REGISTER BUTTON
                            ElevatedButton(
                              onPressed: () async { await registryUser(); }, // TRY TO REGISTRY THE INPUT DATA INTO DB
                              style: ElevatedButton.styleFrom( textStyle: const TextStyle(fontSize: 30.0), 
                                                                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 115.0),
                                                                backgroundColor: Colors.white,
                                                                foregroundColor: const Color.fromARGB(255, 54, 157, 216),
                                                                shadowColor: const Color.fromARGB(255, 54, 157, 216),                                                              elevation: 3,
                                                                shape: const ContinuousRectangleBorder(side: BorderSide( color: Color.fromARGB(255, 54, 157, 216),
                                                                                                                         width: 2,
                                                                                                            ),
                                                                            ),
                                      ),
                              child: const Text("Register"),
                            ),
                          ],
                        ),

                        const SizedBox(height: 150.0),
                      ],
                    ),
                ),
            ),
      
            // RIGHT COLUMN WITH IMAGE IN THE MAIN ROW
            Expanded(
              flex: 1, // GETS HALF SCREEN
        
              // CONTAINER OF THE IMAGE
              child: 
                Container(
                  color: Colors.white,
        
                  // PLACE WHERE IMAGE IS PLACED
                  child: 
                    Center(
        
                    // ACTUAL IMAGE
                    child: 
                      AspectRatio(
                        aspectRatio: 1.0,
        
                        child:
                        Image.asset( "../../assets/img/integra.PNG",
                                    fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ),
            ),
          ],
        ),
      ),

      // TODO: DELETE - THIS IS FOR FAST USE OF TODOLIST
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/contacts', arguments: 1);
        },
        backgroundColor: Colors.lightBlue[900],
        child: const Text('Contact'),
      ),
    );
  }

}