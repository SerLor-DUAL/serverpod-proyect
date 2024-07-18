import 'package:flutter/material.dart';
import 'package:proyect_client/proyect_client.dart';

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
  {
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
    else 
    {
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

  
  // ------------------------------------- FLUTTER ------------------------------------------- //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* APPBAR 
        appBar: AppBar(
          title: const Text(
                        "IntegraQS ToDoList",
                        style: TextStyle(
                          color: Colors.white
                        )),
          centerTitle: true,
          backgroundColor: Colors.lightBlue[900],
        ), */
        body: LayoutBuilder(
                builder: (context, constraints) {
                  // Let's set the width of our textFields upto 50% of the screen
                  double textFieldWidth = constraints.maxWidth * 0.30;
                  double textFieldHeigh = constraints.maxHeight;
                  double imageWidth = constraints.maxWidth * 0.70;
            
                  return Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // Set container width
                            width: textFieldWidth,
                            height: textFieldHeigh,
                            padding: const EdgeInsetsDirectional.symmetric(horizontal: 30.0, vertical: 20.0),
                            color: const Color.fromARGB(239, 248, 248, 248),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: const TextSpan(
                                          text: 'Integra',
                                          style: TextStyle(
                                            fontSize: 30.00,
                                            color: Color.fromARGB(255, 124, 214, 255),
                                            fontWeight: FontWeight.w800,
                                            ),
                                          children: [
                                            TextSpan(
                                              text: 'QS',
                                              style: TextStyle(
                                                fontSize: 30.00,
                                                color: Color.fromARGB(255, 124, 214, 255),
                                                fontWeight: FontWeight.w100,
                                              ),
                                            )
                                          ]
                                        )),
                                      const SizedBox(height: 100.0),
                                      TextFormField(controller: userController,
                                                    decoration: const InputDecoration( border: OutlineInputBorder(),
                                                                                       hintText: "User"
                                       ),
                                       validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                        },
                                      ),     
                                      const SizedBox(height: 20.0),
                                      TextFormField( controller: passwordController,
                                                     decoration: const InputDecoration( border: OutlineInputBorder(),
                                                                                        hintText: "Password"
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(horizontal: 35.00, vertical: 20.0), // Increase button size
                                            textStyle: const TextStyle(fontSize: 20), // Increase font size
                                        ),
                                        onPressed: () async {
                                          await loginUser();
                                          }, 
                                        child: const Text("Login")
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(horizontal: 35.00, vertical: 20.0), // Increase button size
                                            textStyle: const TextStyle(fontSize: 20), // Increase font size
                                        ),
                                        onPressed: () {
                                             Navigator.pushNamed(context, '/register');
                                            } ,
                                        
                                        child: const Text("Register")
                                      ),
                                    ],
                                  )
                                ],),
                            )
                          ],
                        ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: imageWidth,
                            child: Image.asset(
                              ("../../assets/img/integra.PNG"),
                              fit: BoxFit.fill),
                          ),
                          
                        ],),
                    ],
                  );
                }

          ),
        
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/todolist');
            },
          backgroundColor: Colors.lightBlue[900],
          child: const Text('ToDoList'),
        ),
      );
    }
  }