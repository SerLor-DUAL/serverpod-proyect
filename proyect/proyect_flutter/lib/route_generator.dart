import 'package:flutter/material.dart';
import 'package:proyect_flutter/app_routes.dart';
import 'package:proyect_flutter/contact/contact_list.dart';
import 'package:proyect_flutter/log-reg/register.dart';
import 'package:proyect_flutter/todolist/to_do_list.dart';
import 'log-reg/login.dart';
import 'package:proyect_client/proyect_client.dart';

// We will run all our routes through a RouteGenerator.
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        // NAV TO LOGIN
        final client = settings.arguments as Client;        
        return buildRoute(Login(client: client,), settings: settings);
      case AppRoutes.register:
        // NAV TO REGISTER
        var client = settings.arguments as Client;
        return buildRoute(Register(client: client), settings: settings);
      // NAV TO TODOLIST USING BasicArguments
      case AppRoutes.todoList:
        var args = settings.arguments as BasicArguments;
        return buildRoute(ToDoList(client: args.client, userId: args.userID),
            settings: settings);
      case AppRoutes.contacts:
        var args = settings.arguments as BasicArguments;
        return buildRoute(ContactList(client: args.client, userId: args.userID),
            settings: settings);
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Text("Route not found");
  });
}
// RouteBuilder
MaterialPageRoute buildRoute(Widget child, {required RouteSettings settings}) {
  return MaterialPageRoute(builder: (BuildContext context) => child);
}

// BasicArguments will be useful for multiple routes.
// Contacts and TodoList for example.
class BasicArguments {
  final Client client;
  final int userID;

  const BasicArguments({required this.client, required this.userID});
}
