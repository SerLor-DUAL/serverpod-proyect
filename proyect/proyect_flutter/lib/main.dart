import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import 'package:proyect_flutter/log-reg/register.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'log-reg/login.dart';
import 'toDoList/to_do_list.dart';

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
      '/' : (context) => Login(client: client,),
      '/register' : (context) => Register(client: client,),
      '/todolist' : (context) {
        // We will need to extract arguments to set our ToDoList.
        // ModalRoute get the arguments and return a kind of object
        final args = ModalRoute.of(context)?.settings.arguments;
        // If in the args we get an integer (userID), we will adapt our ToDoList
        if (args is int) {
          return ToDoList(client: client, userId: args);
        }
        // TODO: We need to create an error popup to call here.
        return ToDoList(client: client, userId: 1);
      },
    },
  ));
} 





