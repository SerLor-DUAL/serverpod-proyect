import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';

part '../domain/pop_up_edit_task_controller.dart';

class EditTaskPopUp extends StatefulWidget {
  // WORKS WITH CLIENT AND TASK
  final Client client;
  final Task task;

  const EditTaskPopUp({super.key, required this.client, required this.task});

  @override
  createState() => _EditTaskPopUp();
}

class _EditTaskPopUp extends EditTaskPopUpController {
// ----------------------- BUILDER ------------------------------ //
  @override
  Widget build(BuildContext context) {
    // RETURNS ALERTDIALOG
    return AlertDialog(
      title: const Text('Edit your task'),
      // COLUMN WITH TEXTFIELDS
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // TITLE TEXTFIELD
          TextField(
            controller: _titleCon,
            decoration: InputDecoration(
              labelText: 'Title',
              hintText: widget.task.title,
            ),
          ),
          // DESCRIPTION TEXTFIELD
          TextField(
            controller: _descriptionCon,
            decoration: InputDecoration(
              labelText: 'Description',
              hintText: widget.task.description,
            ),
          ),
          // DEADLINE TEXTFIELD
          TextField(
            controller: _dateCon,
            decoration: InputDecoration(
              labelText: 'DeadLine',
              hintText: (widget.task.deadLine != null)
                  ? widget.task.deadLine!.toIso8601String()
                  : null,
            ),
          ),
        ],
      ),
      // SUBMIT BUTTON
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            // Update task and go back to the previous page.
            await updateTask();

            if (!context.mounted) return;
            Navigator.pop(context);
          },
          child: const Text('Edit'),
        ),
      ],
    );
  }
}
