import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import 'package:proyect_flutter/authentication/login/presentation/login_screen.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

import 'common/services/app_routes.dart';
import 'common/services/route_generator.dart';


// SETS UP A SINGLETON CLIENT OBJECT THAT CAN BE USED TO TALK TO THE SERVER FROM
// ANYWHERE IN OUR APP. THE CLIENT IS GENERATED FROM YOUR SERVER CODE.
// THE CLIENT IS SET UP TO CONNECT TO A SERVERPOD RUNNING ON A LOCAL SERVER ON
// THE DEFAULT PORT. YOU WILL NEED TO MODIFY THIS TO CONNECT TO STAGING OR
// PRODUCTION SERVERS.
Client client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Sample App',
    home: LoginScreen(client: client,),
    onGenerateRoute: RouteGenerator.generateRoute,
  );
}

  String getInitialPage() => AppRoutes.login;
}



