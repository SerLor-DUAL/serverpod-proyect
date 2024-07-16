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

  void registryUser () async{ 
    PasswordOptions options = PasswordOptions(automatedPassword: false,
                                              passwordLengthOption: null,
                                              upperOption: null,
                                              numberOption: null,
                                              specialOption: null);
    if (passwordController.text == confirmController.text) {
      PasswordGenerator pass = PasswordGenerator(optionsId: options.id!, password: passwordController.text);
      UsersRegistry user =  UsersRegistry(userName: userController.text,
                                          userPasswordId: pass.id!,
                                          userPassword: pass);
      await widget.client.usersRegistry.createUser(user);
    }
  }

  void SeeUser() async{
    var abc = await widget.client.usersRegistry.getUserById(1);
    print(abc!.userName);
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
                                        onPressed: () {
                                          registryUser();
                                          SeeUser(); }, 
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