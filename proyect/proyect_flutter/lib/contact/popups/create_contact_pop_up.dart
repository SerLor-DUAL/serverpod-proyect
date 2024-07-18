import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
// import '../alertdialogs/error_alert_dialog.dart';

class CreateContactPopUp extends StatefulWidget {
  // THIS CreateTaskPopUp ALWAYS WILL NEED THE CLIENT TO OPERATE WITH DB
  // AND userID TO WORK FOR THAT USER.
  final Client client;
  final int userID;

  const CreateContactPopUp(
      {super.key, required this.client, required this.userID});
  @override
  CreateContactPopUpState createState() => CreateContactPopUpState();
}

class CreateContactPopUpState extends State<CreateContactPopUp> {
  // CONTROLLERS
  final TextEditingController _nameCon = TextEditingController();
  final TextEditingController _phoneCon = TextEditingController();

  // TAKES CONTROLLER'S DATA AND CREATE A TASK
  Contact createContactWithData() {
    return Contact(
        name: _nameCon.text,
        phoneNumber: _phoneCon.text,
        userID: widget.userID);
  }

  // CHECKS IF ERROR EXISTS
  // TODO: ADAPT
  String checkIfError() {
    String error = '';

    if (_nameCon.text == '') {
      error += 'Title';
    }
    return error;
  }

  // IF THERE'S NO ERROR IN THE TASK. CREATES THE TASK IN THE DB,
  // ELSE POPUP ErrorAlertDialog
  Future<void> createContact() async {
    Contact newContact = createContactWithData();

    await widget.client.contact.addContact(newContact);
    // TODO: ADAPT
    /*
    String error = checkIfError();

    if (error == '') {
      Task newTask = createTaskWithData();
      await widget.client.tasks.addTask(newTask);
    } else {
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorAlertDialog(
              errorTitle: 'Error in $error',
              errorContent: '$error cannot be empty.',
            );
          });
      return;
    }
    */
  }

// ----------------------- BUILDER ------------------------------ //
  @override
  Widget build(BuildContext context) {
    // RETURNS ALERTDIALOG
    return AlertDialog(
      title: const Text('Create a new task'),
      // COLUMN
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // NAME TEXTFIELD
          TextField(
            controller: _nameCon,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
          // PHONE TEXTFIELD
          TextField(
            controller: _phoneCon,
            decoration: const InputDecoration(
              labelText: 'Phone',
            ),
          ),
         
        ],
      ),
      // ACTION -- SUBMIT
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            // IF EVERYTHING OKAY. CREATE TASK, ELSE
            // RETURN ERROR AND CLOSE
            await createContact();

            if (!context.mounted) return;
            Navigator.pop(context);
          },
          child: const Text('Add Task'),
        ),
      ],
    );
  }
}
