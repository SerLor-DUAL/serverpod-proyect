import 'package:flutter/material.dart';
import 'package:proyect_client/proyect_client.dart';

class Register extends StatefulWidget {
  
  Client client;
  Register({super.key, required this.client});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  // Set controllers
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  Future<void> registryUser() async {
    try 
    {
      PasswordOptions options = PasswordOptions(automatedPassword: false,
                                                passwordLengthOption: null,   // Puedes definir un valor por defecto si no es nulo
                                                upperOption: null,            // Por defecto puedes definir como falso
                                                numberOption: null,           // Por defecto puedes definir como verdadero
                                                specialOption: null );        // Por defecto puedes definir como falso

      // Primero, guarda las opciones de contraseña
      await widget.client.passwordOptions.createOptions(options);

      // Después de la inserción, obtiene el ID de las opciones de contraseña
      PasswordOptions? createdOptions = await widget.client.passwordOptions.getOptions(options.id!);

      if (createdOptions == null) 
      {
        await widget.client.passwordOptions.deleteOptions(options);
        throw Exception("Failed to create PasswordOptions.");
      } 
      else 
      {
        // Crea una nueva contraseña
        PasswordGenerator createdPass = PasswordGenerator(optionsId: createdOptions.id!,
                                                          options: createdOptions,
                                                          password: passwordController.text );

        await widget.client.passwordGenerator.createPassword(options, passwordInput: createdPass.password);

        // Crea un nuevo usuario
        UsersRegistry createdUser = UsersRegistry(userName: userController.text,
                                                  userPasswordId: createdPass.id!,
                                                  userPassword: createdPass );

        await widget.client.usersRegistry.createUser(createdUser);

        // Call seeUser after user registration
        await seeUser();
      }
    } catch (e) {
        // Handle any errors
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

    Future<void> seeUser() async {
    // Get the user by name
    var abc = await widget.client.usersRegistry.getUserById(1);

    // Verificar si el widget todavía está montado antes de usar context
    if (!mounted) return;

    if (abc == null) {
      // Mostrar un mensaje de error si no se encuentra el usuario
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("User"),
          content: Text("User not found."),
        ),
      );
    } else {
      // Mostrar un mensaje de bienvenida si el usuario es encontrado
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("User"),
          content: Text("Welcome ${abc.userName}"),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
                        "IntegraQS ToDoList",
                        style: TextStyle(
                          color: Colors.white
                        )),
          centerTitle: true,
          backgroundColor: Colors.lightBlue[900],
        ),
        body: Container(
              // LayoutBuilder lets you addapt your layouts to the width of your screen.
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Let's set the width of our textFields upto 50% of the screen
                  double textFieldWidth = constraints.maxWidth*0.30;
                  double textFieldHeigh = constraints.maxHeight;
                  double imageWidth = constraints.maxWidth*0.70;
            
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
                                      TextFormField(
                                        controller: userController,
                                        decoration: const InputDecoration(
                                                    border: OutlineInputBorder(),
                                                    hintText: "User"),
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
                                                    hintText: "Password"),
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
                                                    hintText: "Confirm Password"),
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
                                          Navigator.pop(context);
                                          }, 
                                        child: const Text("Login")
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(horizontal: 35.00, vertical: 20.0), // Increase button size
                                            textStyle: const TextStyle(fontSize: 20), // Increase font size
                                        ),
                                        onPressed: () async {
                                          await registryUser();
                                          await seeUser(); }, 
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
                          Container(
                            width: imageWidth,
                            child: Image.asset(
                              ("../assets/img/integra.PNG"),
                              fit: BoxFit.fill),
                          )
                        ],),
                    ],
                  );
                }
              ),
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