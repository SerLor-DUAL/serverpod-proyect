part of '../presentation/home.dart';

abstract class HomeController extends State<Home> {
  // HOVERING BOOLS
  bool _isHoveringOptions = false;
  bool _isHoveringLogOut = false;
  bool _isHoveringList = false;
  bool _isHoveringChat = false;
  bool _isHoveringToDo = false;

  int _currentIndex = 0;

  // PAGING INDEX
  Widget _getCurrentPage() {
    switch (_currentIndex) {
      case 0:
        return const Center(
            child:
                Text('TODO: Options Screen', style: TextStyle(fontSize: 24)));
      case 1:
        return ContactList(client: widget.client, user: widget.user);
      case 2:
        return ToDoList(client: widget.client, user: widget.user);
      case 3:
        return const Center(
            child: Text('TODO: Chat Screen', style: TextStyle(fontSize: 24)));
      default:
        return const Center(
            child: Text('Unknown Screen', style: TextStyle(fontSize: 24)));
    }
  }

  void _askForExitConfirmation() async {
    await showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        customTitle: "Exit Session?",
        customContent: "Are you sure you want to exit the session?",
        customActions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              widget.client.authenticated.logout();
              Navigator.pushNamed(context, AppRoutes.login, arguments: widget.client);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
