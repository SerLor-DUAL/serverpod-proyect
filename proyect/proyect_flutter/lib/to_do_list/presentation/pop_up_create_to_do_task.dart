import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import '../../common/ui/error_alert_dialog.dart';
part '../domain/pop_up_create_task_controller.dart';

class CreateTaskPopUp extends StatefulWidget {
  // THIS CreateTaskPopUp ALWAYS WILL NEED THE CLIENT TO OPERATE WITH DB
  // AND userID TO WORK FOR THAT USER.
  final Client client;
  final int userID;

  const CreateTaskPopUp(
      {super.key, required this.client, required this.userID});

  @override
  createState() => _CreateTaskPopUp();
}

class _CreateTaskPopUp extends CreateTaskPopUpController {
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
