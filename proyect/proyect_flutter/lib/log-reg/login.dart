import 'package:flutter/material.dart';
import 'package:proyect_client/proyect_client.dart';

class Login extends StatefulWidget {
  Client client;
  
  Login({super.key, required this.client});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                                      const TextField(
                                        decoration: InputDecoration(
                                                    border: OutlineInputBorder(),
                                                    hintText: "User"
                                        ),
                                      ),
                                      
                                      const SizedBox(height: 20.0),
                                      
                                      const TextField(
                                        decoration: InputDecoration(
                                                    border: OutlineInputBorder(),
                                                    hintText: "Password",)
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
                                          null;
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