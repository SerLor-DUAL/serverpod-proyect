import 'package:flutter/material.dart';
import 'package:proyect_flutter/app_routes.dart';
import 'package:proyect_flutter/contact/contact_list.dart';
import 'package:proyect_flutter/contact/contact_detail.dart';
import 'package:proyect_flutter/routing/pages/login/login_screen.dart';
import 'package:proyect_flutter/routing/pages/register/register_screen.dart';
import 'package:proyect_flutter/todolist/to_do_list.dart';
import 'package:proyect_client/proyect_client.dart';

// We will run all our routes through a RouteGenerator.
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        // NAV TO LOGIN SCREEN
        final client = settings.arguments as Client;        
        return buildRoute(LoginScreen(client: client,), settings: settings);
      case AppRoutes.register:
        // NAV TO REGISTER SCREEN
        var client = settings.arguments as Client;
        return buildRoute(RegisterScreen(client: client), settings: settings);
      // NAV TO TODOLIST USING BasicArguments
      case AppRoutes.todoList:
        var args = settings.arguments as BasicArguments;
        return buildRoute(ToDoList(client: args.client, userId: args.userID),
            settings: settings);
      case AppRoutes.contacts:
        var args = settings.arguments as BasicArguments;
        return buildRoute(ContactList(client: args.client, userId: args.userID),
            settings: settings);
      case AppRoutes.contactDetail:
        final args = settings.arguments as ContactDetailsArgs;
        return buildRoute(ContactDetails(client: args.client, contact: args.contact),
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

class ContactDetailsArgs extends BasicArguments{
  final Contact contact;

  const ContactDetailsArgs({required super.client, required super.userID, required this.contact});
}

class TaskDetails extends BasicArguments{
  final Task task;

  const TaskDetails({required super.client, required super.userID, required this.task});
}

