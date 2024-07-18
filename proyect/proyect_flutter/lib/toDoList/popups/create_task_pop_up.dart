import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import '../alertdialogs/error_alert_dialog.dart';

class CreateTaskPopUp extends StatefulWidget {
  // THIS CreateTaskPopUp ALWAYS WILL NEED THE CLIENT TO OPERATE WITH DB
  // AND userID TO WORK FOR THAT USER.
  final Client client;
  final int userID;

  const CreateTaskPopUp(
      {super.key, required this.client, required this.userID});
  @override
  CreateTaskPopUpState createState() => CreateTaskPopUpState();
}

class CreateTaskPopUpState extends State<CreateTaskPopUp> {
  // CONTROLLERS
  final TextEditingController _titleCon = TextEditingController();
  final TextEditingController _descriptionCon = TextEditingController();
  final TextEditingController _dateCon = TextEditingController();

  // TAKES CONTROLLER'S DATA AND CREATE A TASK
  Task createTaskWithData() {
    return Task(
        title: _titleCon.text,
        description: _descriptionCon.text,
        deadLine: (_dateCon.text != '') ? DateTime.parse(_dateCon.text) : null,
        complete: false,
        userID: widget.userID);
  }

  // CHECKS IF ERROR EXISTS
  String checkIfError() {
    String error = '';

    if (_titleCon.text == '') {
      error += 'Title';
    }
    return error;
  }

  // IF THERE'S NO ERROR IN THE TASK. CREATES THE TASK IN THE DB,
  // ELSE POPUP ErrorAlertDialog
  Future<void> createTask() async {
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
          // TITLE TEXTFIELD
          TextField(
            controller: _titleCon,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          // DESCRIPTION TEXTFIELD
          TextField(
            controller: _descriptionCon,
            decoration: const InputDecoration(
              labelText: 'Description',
            ),
          ),
          // DEADLINE TEXTFIELD
          TextField(
            controller: _dateCon,
            decoration: const InputDecoration(
              labelText: 'DeadLine',
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
            await createTask();

            if (!context.mounted) return;
            Navigator.pop(context);
          },
          child: const Text('Add Task'),
        ),
      ],
    );
  }
}
