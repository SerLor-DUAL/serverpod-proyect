import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import 'package:proyect_flutter/log-reg/register.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'log-reg/login.dart';
import 'todolist/to_do_list.dart';
import 'alertdialogs/error_alert_dialog.dart';
import 'contact/contact_list.dart';
import 'route_generator.dart';
import 'app_routes.dart';

// SETS UP A SINGLETON CLIENT OBJECT THAT CAN BE USED TO TALK TO THE SERVER FROM
// ANYWHERE IN OUR APP. THE CLIENT IS GENERATED FROM YOUR SERVER CODE.
// THE CLIENT IS SET UP TO CONNECT TO A SERVERPOD RUNNING ON A LOCAL SERVER ON
// THE DEFAULT PORT. YOU WILL NEED TO MODIFY THIS TO CONNECT TO STAGING OR
// PRODUCTION SERVERS.
Client client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(MaterialApp(
      title: 'Sample App',
      initialRoute: AppRoutes.login,
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
    ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      initialRoute: AppRoutes.login,
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
    );
  }
}




