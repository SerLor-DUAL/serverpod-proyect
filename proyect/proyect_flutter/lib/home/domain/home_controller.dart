part of '../presentation/home.dart';

abstract class HomeController extends State<Home> {
  // HOVERING BOOLS
  bool _isHoveringOptions = false;
  bool _isHoveringLogOut = false;
  bool _isHoveringList = false;
  bool _isHoveringChat = false;
  bool _isHoveringToDo = false;

  int currentIndex = 0;

  Contact? selectedContact;
  Task? selectedTask;


  // PAGING INDEX
  Widget _getCurrentPage() {
    switch (currentIndex) {
      case 0:
        return const Center(
            child:
                Text('TODO: Options Screen', style: TextStyle(fontSize: 24)));
      case 1:
        return ContactList(
          client: widget.client,
          user: widget.user,
          updateHomeIndex: updateIndex,
          selectContact: selectContact,
        );
      case 2:
        return ToDoList(
          client: widget.client,
          user: widget.user,
          updateHomeIndex: updateIndex,
          selectTask: selectTask,
        );
      case 3:
        return const Center(
            child: Text('TODO: Chat Screen', style: TextStyle(fontSize: 24)));
      case 4:
        if (selectedContact != null) {
          return ContactDetails(
              client: widget.client, 
              contact: selectedContact!,
              user: widget.user);
        } else {
          return const Center(
              child:
                  Text('No Contact Selected', style: TextStyle(fontSize: 24)));
        }
        case 5:
        if (selectedTask != null) {
          return TaskDetails(
              client: widget.client, task: selectedTask!);
        } else {
          return const Center(
              child:
                  Text('No Task Selected', style: TextStyle(fontSize: 24)));
        }
      default:
        return const Center(
            child: Text('Unknown Screen', style: TextStyle(fontSize: 24)));
    }
  }

  void updateIndex(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  void selectContact(Contact contact) {
    setState(() {
      selectedContact = contact;
    });
  }

    void selectTask(Task task) {
    setState(() {
      selectedTask= task;
    });
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
