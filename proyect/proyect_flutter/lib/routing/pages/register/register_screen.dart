import 'package:flutter/material.dart';
import 'package:proyect_client/proyect_client.dart';
import '../../../route_generator.dart';
import '../../../app_routes.dart';

part './register_controller.dart';

class RegisterScreen extends StatefulWidget 
{

  final Client client;
  const RegisterScreen({super.key, required this.client});

  @override
  createState() => _RegisterScreen();
}

class _RegisterScreen extends RegisterController 
{

  // ------------------------------------- UI ------------------------------------------- //

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
        color: Colors.white,

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
                                                                  color: Color.fromARGB(255, 54, 157, 216),
                                                                  fontWeight: FontWeight.w800,
                                                                  shadows: 
                                                                    <Shadow> [
                                                                      Shadow( offset: Offset(1, 1),
                                                                              blurRadius: 1.0,
                                                                              color: Colors.white,
                                                                      ),
                                                                      Shadow( offset: Offset(2, 2),
                                                                              blurRadius: 2.0,
                                                                              color: Colors.white,
                                                                      ),
                                                                      Shadow( offset: Offset(3, 3),
                                                                              blurRadius: 3.0,
                                                                              color: Colors.white,
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
                    AspectRatio(
                      aspectRatio: 1.0,
                            
                      child:
                      Image.asset( "../../assets/img/integra2.PNG",
                                  fit: BoxFit.cover,
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
          BasicArguments args = BasicArguments(client: widget.client, userID: 1);
          Navigator.pushNamed(context, AppRoutes.contacts, arguments: args);
        },
        backgroundColor: Colors.lightBlue[900],
        child: const Text('Contact'),
      ),
    );
  }

}