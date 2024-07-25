import 'package:flutter/material.dart';
import 'package:proyect_flutter/common/services/app_routes.dart';
import 'package:proyect_flutter/contacts/presentation/contact_list.dart';
import 'package:proyect_flutter/contacts/presentation/contact_details.dart';
import 'package:proyect_flutter/authentication/login/presentation/login.dart';
import 'package:proyect_flutter/authentication/register/presentation/register.dart';
import 'package:proyect_flutter/to_do_list/presentation/to_do_list.dart';
import 'package:proyect_client/proyect_client.dart';
import 'package:proyect_flutter/home/presentation/home.dart';
import 'package:proyect_flutter/to_do_list/presentation/to_do_task_details.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        var args = settings.arguments as BasicArguments;
        return buildRoute(Home(client: args.client, user: args.user), settings: settings);

      case AppRoutes.login:
        final client = settings.arguments as Client;
        return buildRoute(Login(client: client), settings: settings);

      case AppRoutes.register:
        var client = settings.arguments as Client;
        return buildRoute(Register(client: client), settings: settings);

      // IT HAS A CALLBACK TO TASK DETAILS AND HOME
      // TO DO LIST
      case AppRoutes.todoList:
        var args = settings.arguments as BasicArguments;
        return buildRoute(ToDoList(client: args.client, user: args.user, updateHomeIndex: (_) {}, selectTask: (_) {}), settings: settings);

      // TASKS FROM TO DO LIST
      case AppRoutes.taskDetail:
        final args = settings.arguments as TaskDetailsArgs;
        return buildRoute(TaskDetails(client: args.client, task: args.task), settings: settings);

      // IT HAS A CALLBACK TO CONTACT DETAILS AND HOME
      // CONTACTS LIST
      case AppRoutes.contacts:
        var args = settings.arguments as BasicArguments;
        return buildRoute(ContactList(client: args.client, user: args.user, updateHomeIndex: (_) {}, selectContact: (_) {}), settings: settings);

      // DETAILS FROM SELECTED CONTACT OF THE CONTACT LIST
      case AppRoutes.contactDetail:
        final args = settings.arguments as ContactDetailsArgs;
        return buildRoute(ContactDetails(client: args.client, contact: args.contact, user: args.user, updateHomeIndex: (_) {},), settings: settings);

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

MaterialPageRoute buildRoute(Widget child, {required RouteSettings settings}) {
  return MaterialPageRoute(builder: (BuildContext context) => child);
}

class BasicArguments {
  final Client client;
  final UsersRegistry user;

  const BasicArguments({required this.client, required this.user});
}

class ContactDetailsArgs extends BasicArguments {
  final Contact contact;

  const ContactDetailsArgs({required super.client, required super.user, required this.contact});
}

class TaskDetailsArgs extends BasicArguments {
  final Task task;

  const TaskDetailsArgs({required super.client, required super.user, required this.task});
}