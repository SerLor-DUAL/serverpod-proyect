import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import 'package:proyect_flutter/log-reg/register.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'log-reg/login.dart';
import 'todolist/to_do_list.dart';
import 'todolist/alertdialogs/error_alert_dialog.dart';
import 'contact/contact_list.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
Client client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(MaterialApp(
    routes: {
      // This will set our basic routes for the proyect.
      // Later we will have to work with dinamic routes.
      '/': (context) => Login(
            client: client,
          ),
      '/register': (context) => Register(
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





