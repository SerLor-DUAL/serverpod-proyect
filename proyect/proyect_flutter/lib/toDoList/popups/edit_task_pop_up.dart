import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';

class EditTaskPopUp extends StatefulWidget {
  // WORKS WITH CLIENT AND TASK
  final Client client;
  final Task task;

  const EditTaskPopUp({super.key, required this.client, required this.task});
  @override
  EditTaskPopUpState createState() => EditTaskPopUpState();
}

class EditTaskPopUpState extends State<EditTaskPopUp> {
  // CONTROLLERS
  final TextEditingController _titleCon = TextEditingController();
  final TextEditingController _descriptionCon = TextEditingController();
  final TextEditingController _dateCon = TextEditingController();

// Edit the selected task. Changing, just if the user wanted to, the title, description and/or deadline.
  Task editTaskWithData() {
    Task task = widget.task;
    task.title = (_titleCon.text != '') ? _titleCon.text : task.title;
    task.description =
        (_descriptionCon.text != '') ? _descriptionCon.text : task.description;
    task.deadLine =
        (_dateCon.text != '') ? DateTime.parse(_dateCon.text) : task.deadLine;

    return task;
  }

  // Update the Task in the DB.
  Future<void> updateTask() async {
    Task newTask = editTaskWithData();
    await widget.client.tasks.updateTask(newTask);
  }

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
