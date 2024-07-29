part of '../presentation/home.dart';

abstract class HomeController extends State<Home> {
  
  // HOVERING BOOLS
  bool _isHoveringOptions = false;
  bool _isHoveringLogOut = false;
  bool _isHoveringList = false;
  bool _isHoveringChat = false;
  bool _isHoveringToDo = false;

  // ------------------------------ PAGE INDEXING -------------------------------------

  // ACTUAL PAGE
  int currentIndex = 0;

  // UPDATES THE INDEX OF HOME
  void updateIndex(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

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
              updateHomeIndex: updateIndex,
              user: widget.user);
        } else {
          return const Center(
              child:
                  Text('No Contact Selected', style: TextStyle(fontSize: 24)));
        }
      default:
        return const Center(
            child: Text('Unknown Screen', style: TextStyle(fontSize: 24)));
    }
  }

  // ---------------------------------------------------------------------------------

  // ------------------------------ SIDEBAR ------------------------------------------

  bool _isSidebarExpanded = true; // ACTUAL STATUS
  bool _isSidebarManuallyToggled = false; // MANUAL TOGGLE OF SIDEBAR
  final double _sidebarBreakpoint = 600.0;
  double screenWidth = 0.0;

  // UPDATES SCREEN SIZING
  void _updateScreenWidth(double width) {
    setState(() {
      screenWidth = width;
      // IF THE WIDTH IS LESS THAN OR EQUAL TO THE BREAKPOINT AND THE SIDEBAR IS EXPANDED, COLLAPSE IT AUTOMATICALLY
      if (screenWidth <= _sidebarBreakpoint && _isSidebarExpanded) {
        _isSidebarExpanded = false;
        _isSidebarManuallyToggled = false;
      }
    });
  }

  // SIDEBAR STATUS CHANGER
  void _toggleSidebar() {
    setState(() {
      if (screenWidth <= _sidebarBreakpoint) {
        _isSidebarExpanded = !_isSidebarExpanded;
      } else {
        _isSidebarExpanded = !_isSidebarExpanded;
        _isSidebarManuallyToggled = _isSidebarExpanded;
      }
    });
  }

  // ------------------------------------------------------------------------------------

  // ------------------------------ CALLBACK --------------------------------------------

  // CALLBACK VARIABLES
  Contact? selectedContact;
  Task? selectedTask;

  // SAVES THE SELECTED CONTACT FROM THE CONTACT LIST WIDGET INTO HOME DATA TO DO A CALLBACK
  void selectContact(Contact contact) {
    setState(() {
      selectedContact = contact;
    });
  }

  // SAVES THE SELECTED TASK FROM THE TASKS LIST WIDGET INTO HOME DATA TO DO A CALLBACK
  void selectTask(Task task) {
    setState(() {
      selectedTask = task;
    });
  }

  // ---------------------------------------------------------------------------------

  // --------------------------- LOGOUT ACTIONS --------------------------------------

  // BUTTON CREATOR FOR LOG OUT
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
              Navigator.pushNamed(context, AppRoutes.login,
                  arguments: widget.client);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------------
}
