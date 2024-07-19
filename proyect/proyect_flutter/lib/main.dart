import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import 'package:proyect_flutter/routing/pages/register/register_page.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'routing/pages/login/login_screen.dart';
import 'todolist/to_do_list.dart';
import 'alertdialogs/error_alert_dialog.dart';
import 'contact/contact_list.dart';

// SETS UP A SINGLETON CLIENT OBJECT THAT CAN BE USED TO TALK TO THE SERVER FROM
// ANYWHERE IN OUR APP. THE CLIENT IS GENERATED FROM YOUR SERVER CODE.
// THE CLIENT IS SET UP TO CONNECT TO A SERVERPOD RUNNING ON A LOCAL SERVER ON
// THE DEFAULT PORT. YOU WILL NEED TO MODIFY THIS TO CONNECT TO STAGING OR
// PRODUCTION SERVERS.
Client client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(MaterialApp(
    routes: {
      // This will set our basic routes for the proyect.
      // Later we will have to work with dinamic routes.
      '/': (context) => LoginScreen(
            client: client,
          ),
      '/register': (context) => RegisterScreen(
            client: client,
          ),
      '/todolist': (context) {
        // We will need to extract arguments to set our ToDoList.
        // ModalRoute get the arguments and return a kind of object
        final args = ModalRoute.of(context)?.settings.arguments;

        // If in the args we get an integer (userID), we will adapt our ToDoList
        if (args is int) {
          return ToDoList(client: client, userId: args);
        }

        // YOU HAVE TO LOGIN TO ACCESS
        return const ErrorAlertDialog(
          errorTitle: 'LOGIN NEEDED',
          errorContent: 'You need to login first.',
        );
      },
      '/contacts' : (context) {
        // We will need to extract arguments to set our ContactList.
        // ModalRoute get the arguments and return a kind of object
        final args = ModalRoute.of(context)?.settings.arguments;

        // If in the args we get an integer (userID), we will adapt our ToDoList
        if (args is int) {
          return ContactList(client: client, userId: args);
        }

        // YOU HAVE TO LOGIN TO ACCESS
        return const ErrorAlertDialog(
          errorTitle: 'LOGIN NEEDED',
          errorContent: 'You need to login first.',
        );
      },
    },
  ));
} 



