import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget{
  @override
  State<RegisterPage> createState() => _RegisterPageState();

}

class _RegisterPageState extends State<RegisterPage> {
  // Set controllers
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  Map<String, String> getValues() {
    return {
      "user" : userController.text,
      "password" : passwordController.text,
      "confirm" : confirmController.text
    };
  }  


  @override
  Widget build(BuildContext context) {
    return Column(
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
          TextField(
            controller: userController,
            decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "User"
            ),
          ),
          
          const SizedBox(height: 20.0),
          
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Password",)
          ),
          const SizedBox(height: 20.0),
          
          TextFormField(
            controller: confirmController,
            decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Confirm Password",)
          ),
        ],
      );
  }
}

