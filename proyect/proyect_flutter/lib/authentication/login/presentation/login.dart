import 'package:flutter/material.dart';
import 'package:proyect_client/proyect_client.dart';
import 'package:proyect_flutter/common/services/app_routes.dart';
import 'package:proyect_flutter/common/services/route_generator.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import '../../../common/ui/custom_alert_dialog.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
part '../domain/login_controller.dart';

class Login extends StatefulWidget {
  final Client client;
  
  const Login({super.key, required this.client});

  @override
  createState() => _Login();
}

class _Login extends LoginController {

  bool passwordHide = true;

  // ------------------------------------- UI ------------------------------------------- //

  @override
  Widget build(BuildContext context) {
    // GETS SCREEN SIZING
    Size screenSize = MediaQuery.of(context).size;

    // CALCULATE RESPONSIVE DIMENSION
    double columnWidth = screenSize.width * 0.35;

    void tooglePasswordHide() {
      setState(() {
        passwordHide = !passwordHide;
      });
    }

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
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),

                // COLUMN WHERE ELEMENTS OF THE CONTAINER WILL BE PLACED
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  // LOGO TITLE TEXT, TEXTFIELDS AND ROW WHERE BUTTONS ARE PLACED
                  children: [
                    // LOGO TITLE TEXT
                    RichText(
                      text: const TextSpan(
                        text: 'IntegraQS',
                        style: TextStyle(
                          fontSize: 80.0,
                          color: Color.fromARGB(255, 54, 157, 216),
                          fontWeight: FontWeight.w800,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 1.0,
                              color: Colors.white,
                            ),
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 2.0,
                              color: Colors.white,
                            ),
                            Shadow(
                              offset: Offset(3, 3),
                              blurRadius: 3.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 100.0),

                    // TEXTBOXES
                    SizedBox(
                      width: columnWidth,
                      child: Column(
                        children: [
                          // USERNAME TEXTFIELD
                          TextField(
                            controller: userController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 54, 157, 216),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Username",
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 54, 157, 216)),
                              filled: true,
                              fillColor: Colors.white,
                              focusColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 54, 157, 216),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 54, 157, 216),
                              fontWeight: FontWeight.bold,
                            ),
                            cursorColor:
                                const Color.fromARGB(255, 54, 157, 216),
                          ),

                          const SizedBox(height: 20.0),

                          // PASSWORD TEXTFIELD
                          TextField(
                            controller: passwordController,
                            obscureText: passwordHide,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 54, 157, 216),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 54, 157, 216)),
                              filled: true,
                              fillColor: Colors.white,
                              focusColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 54, 157, 216),
                                  width: 2,
                                ),
                              
                              
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffixIcon: IconButton(
                                              onPressed: () {
                                                tooglePasswordHide();
                                              },
                                              icon: (passwordHide)?
                                                      const Icon(Icons.remove_red_eye_outlined) :
                                                      const Icon(Icons.remove_red_eye),
                                              color: const Color.fromARGB(255, 54, 157, 216),),
                            ),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 54, 157, 216),
                              fontWeight: FontWeight.bold,
                            ),
                            cursorColor:
                                const Color.fromARGB(255, 54, 157, 216),
                          ),

                          const SizedBox(height: 120.0),
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
                          onPressed: () async {
                            await loginUser();
                          }, // RETURNS TO MAIN NAVIGATION MENU
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 30.0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 115.0),
                            backgroundColor: Colors.white,
                            foregroundColor:
                                const Color.fromARGB(255, 54, 157, 216),
                            shadowColor:
                                const Color.fromARGB(255, 54, 157, 216),
                            elevation: 3,
                            shape: ContinuousRectangleBorder(
                              side: const BorderSide(
                                color: Color.fromARGB(255, 54, 157, 216),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text("Login"),
                        ),

                        const SizedBox(width: 30),

                        // REGISTER BUTTON
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.register,
                                arguments: widget.client);
                          }, // TRY TO REGISTRY THE INPUT DATA INTO DB
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 30.0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 115.0),
                            backgroundColor: Colors.white,
                            foregroundColor:
                                const Color.fromARGB(255, 54, 157, 216),
                            shadowColor:
                                const Color.fromARGB(255, 54, 157, 216),
                            elevation: 3,
                            shape: ContinuousRectangleBorder(
                              side: const BorderSide(
                                color: Color.fromARGB(255, 54, 157, 216),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
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
              child: Container(
                color: Colors.white,

                // PLACE WHERE IMAGE IS PLACED
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Image.asset(
                    "../../assets/img/integra2.PNG",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
