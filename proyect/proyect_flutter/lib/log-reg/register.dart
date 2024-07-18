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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "IntegraQS ToDoList",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[900],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Let's set the width of our textFields upto 30% of the screen
          double textFieldWidth = constraints.maxWidth * 0.30;
          double textFieldHeight = constraints.maxHeight;
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
                    height: textFieldHeight,
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
                                ],
                              ),
                            ),
                            const SizedBox(height: 100.0),
                            TextFormField(
                              controller: userController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "User",
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: passwordController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Password",
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: confirmController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Confirm Password",
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
                              onPressed: () {
                              },
                              child: const Text("Login"),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 35.00, vertical: 20.0), // Increase button size
                                textStyle: const TextStyle(fontSize: 20), // Increase font size
                              ),
                              onPressed: () async {
                                await registryUser();
                              },
                              child: const Text("Register"),
                            ),
                          ],
                        )
                      ],
                    ),
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
                      "../../assets/img/integra.PNG",  // Asegúrate de que esta ruta sea correcta
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
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
