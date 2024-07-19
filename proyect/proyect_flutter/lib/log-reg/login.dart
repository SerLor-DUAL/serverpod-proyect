import 'package:flutter/material.dart';
import 'package:proyect_client/proyect_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class Login extends StatefulWidget {
  final Client client;
  
  const Login({super.key, required this.client});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> 
{
// SET USER TEXT CONTROLLERS
TextEditingController userController = TextEditingController();
TextEditingController passwordController = TextEditingController();

// USER LOGIN FUNCTION
Future<void> loginUser() async 
{
  // CHECK ALL FIELDS ARE BEING USED
  if (userController.text.isEmpty || passwordController.text.isEmpty) 
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

  try 
  {
    /*
    // CHECK IF THE USER EXISTS IN THE DB
    bool userExists = await widget.client.usersRegistry.checkUserExistanceByName(userController.text);*/
     // RETRIEVE USER INFORMATION
    var userToLog = await widget.client.usersRegistry.getUserByName(userController.text);


    if (userToLog == null) 
    {
      if (mounted) 
      {
        showDialog( context: context,
                    builder: (context) => const AlertDialog( title: Text("Error"),
                                                             content: Text("User doesn't exist. Try registering a new user."),
          ),
        );
      }
      return;
    }

   
    // CHECK IF THE PASSWORD IS CORRECT
    bool isValid = await widget.client.usersRegistry.validatePassword(passwordController.text, userToLog.userPassword);
    if (isValid) 
    {
      await welcomeUser(userToLog.id!);
    } 
    else 
    {
      if (mounted)
      {
        showDialog( context: context,
                    builder: (context) => const AlertDialog( title: Text("Error"),
                                                             content: Text("Password is incorrect. Please try again."),
          ),
        );
      }
    }
  } 
  catch (e) 
  {/*
    if (mounted) 
    {
      showDialog( context: context,
                  builder: (context) => AlertDialog( title: const Text("Error"),
                                                     content: Text("Failed to login: $e"),
                                                     actions: [ TextButton( onPressed: () => Navigator.of(context).pop(),
                                                                            child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  */}
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
    else 
    {/*
      showDialog( context: context,
                  builder: (context) => AlertDialog( title: const Text("User"),
                                                    content: Text("Welcome ${user.userName}"),
                                                    actions: [ TextButton( onPressed: () => Navigator.pushNamed(context, '/todolist', arguments: user.id),
                                                                            child: const Text('OK'), 
            ),
          ],
        ),
      );
    */}
  } 
  catch (e) 
  {
    if (mounted) 
    {/*
      showDialog( context: context,
                  builder: (context) => AlertDialog( title: const Text("Error"),
                                                    content: Text("Failed to get user information: $e"),
                                                    actions: [ TextButton( onPressed: () => Navigator.of(context).pop(),
                                                                            child: const Text('OK'),
              ),
          ],
        ),
      );
    */}
  }
}

  
  // ------------------------------------- FLUTTER ------------------------------------------- //

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
                              onPressed: () async { await loginUser(); }, // RETURNS TO MAIN NAVIGATION MENU
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
                              onPressed: () {/* Navigator.pushNamed(context, '/register'); */}, // TRY TO REGISTRY THE INPUT DATA INTO DB
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
          /*Navigator.pushNamed(context, '/contacts', arguments: 1);*/
        },
        backgroundColor: Colors.lightBlue[900],
        child: const Text('Contact'),
      ),
    );
  }
}