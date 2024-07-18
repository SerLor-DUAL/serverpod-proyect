import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import 'package:proyect_flutter/log-reg/register.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'log-reg/login.dart';
import 'toDoList/to_do_list.dart';

// SETS UP A SINGLETON CLIENT OBJECT THAT CAN BE USED TO TALK TO THE SERVER FROM
// ANYWHERE IN OUR APP. THE CLIENT IS GENERATED FROM YOUR SERVER CODE.
// THE CLIENT IS SET UP TO CONNECT TO A SERVERPOD RUNNING ON A LOCAL SERVER ON
// THE DEFAULT PORT. YOU WILL NEED TO MODIFY THIS TO CONNECT TO STAGING OR
// PRODUCTION SERVERS.
Client client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() 
{
  // THIS WILL SET OUR BASIC ROUTES FOR THE PROYECT.
  // LATER WE WILL HAVE TO WORK WITH DINAMIC ROUTES.
  runApp(MaterialApp( routes: { '/' : (context) => Login(client: client, ),
                                '/register' : (context) => Register(client: client, ),

                                // WE WILL NEED TO EXTRACT ARGUMENTS TO SET OUR TODOLIST.
                                // MODALROUTE GET THE ARGUMENTS AND RETURN A KIND OF OBJECT
                                '/todolist' : (context) { final args = ModalRoute.of(context)?.settings.arguments;

                                                          // IF IN THE ARGS WE GET AN INTEGER (USERID), WE WILL ADAPT OUR TODOLIST
                                                          if (args is int) 
                                                          {
                                                            return ToDoList(client: client, userId: args);
                                                          }
                                                          // TODO: WE NEED TO CREATE AN ERROR POPUP TO CALL HERE.
                                                          return ToDoList(client: client, userId: 1);
        }
      },
    ) 
  );
} 





