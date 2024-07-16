import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool login = true;

  void tooglePage() {
    setState(() {
      login = !login;
    });
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
                                  login? LoginPage() : RegisterPage(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(horizontal: 35.00, vertical: 20.0), // Increase button size
                                            textStyle: const TextStyle(fontSize: 20), // Increase font size
                                        ),
                                        onPressed: () {
                                          (!login)? 
                                            tooglePage() : 
                                            null; }, 
                                        child: const Text("Login")
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(horizontal: 35.00, vertical: 20.0), // Increase button size
                                            textStyle: const TextStyle(fontSize: 20), // Increase font size
                                        ),
                                        onPressed: () {
                                          (login)? 
                                            tooglePage() :
                                            context.RegisterPage.get; }, 
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