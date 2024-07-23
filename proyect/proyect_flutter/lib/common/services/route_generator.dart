import 'package:flutter/material.dart';
import 'package:proyect_flutter/common/services/app_routes.dart';
import 'package:proyect_flutter/contacts/presentation/contact_list.dart';
import 'package:proyect_flutter/contacts/presentation/contact_details.dart';
import 'package:proyect_flutter/authentication/login/presentation/login.dart';
import 'package:proyect_flutter/authentication/register/presentation/register.dart';
import 'package:proyect_flutter/to_do_list/presentation/to_do_list.dart';
import 'package:proyect_client/proyect_client.dart';
import 'package:proyect_flutter/home/presentation/home.dart';

// WE WILL RUN ALL OUR ROUTES THROUGH A ROUTEGENERATOR.
class RouteGenerator 
{
  static Route<dynamic> generateRoute(RouteSettings settings) 
  {
    switch (settings.name) 
    {

      // NAV TO HOME SCREEN
      case AppRoutes.home:
        var args = settings.arguments as BasicArguments;   
        return buildRoute(Home(client: args.client, user: args.user), settings: settings);

      // NAV TO LOGIN SCREEN
      case AppRoutes.login:
        final client = settings.arguments as Client;        
        return buildRoute(Login(client: client,), settings: settings);

      // NAV TO REGISTER SCREEN
      case AppRoutes.register:
        var client = settings.arguments as Client;
        return buildRoute(Register(client: client), settings: settings);

      // NAV TO TODOLIST USING BasicArguments
      case AppRoutes.todoList:
        var args = settings.arguments as BasicArguments;
        return buildRoute(ToDoList(client: args.client, user: args.user),
            settings: settings);

      case AppRoutes.contacts:
        var args = settings.arguments as BasicArguments;
        return buildRoute(ContactList(client: args.client, user: args.user),
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
  final UsersRegistry user;

  const BasicArguments({required this.client, required this.user});
}

class ContactDetailsArgs extends BasicArguments{
  final Contact contact;

  const ContactDetailsArgs({required super.client, required super.user, required this.contact});
}

class TaskDetails extends BasicArguments{
  final Task task;

  const TaskDetails({required super.client, required super.user, required this.task});
}

