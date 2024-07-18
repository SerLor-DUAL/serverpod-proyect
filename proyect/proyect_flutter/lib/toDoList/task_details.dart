import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import 'package:proyect_flutter/main.dart';

class TaskDetails extends StatefulWidget {
  // NEEDS A TASK TO EDIT AND CLIENT TO WORK WITH DB
  final Task task;
  final Client client;

  const TaskDetails({super.key, required this.task, required this.client});

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

// DELETE TASK
Future<void> deleteTask(Task task) async {
  await client.tasks.deleteTask(task);
}

class _TaskDetailsState extends State<TaskDetails> {
// ----------------------- BUILDER ------------------------------ //
  @override
  Widget build(BuildContext context) {
    // WE SET THE TASK WE WILL WORK ON.
    Task task = widget.task;

    return Scaffold(
      // APPBAR
      appBar: AppBar(
        title: Text(task.title, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[900],
      ),
      // BODY : CENTERED COLUMN
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // IF TASK DOES HAVE A DESCRIPTION ADD IT.
            (task.description != null)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("Description:",
                          style: TextStyle(
                            fontSize: 40.00,
                          )),
                      Text(task.description!,
                          style: const TextStyle(
                            fontSize: 20.00,
                          )),
                    ],
                  )
                :
                // IF TASK DOESN'T EXISTS. DON'T SHOW NULL
                const Text("There's no description",
                    style: TextStyle(
                      fontSize: 40.00,
                    )),

            // IF TASK DOES HAVE A DEADLINE ADD IT. ELSE DONT.
            (task.deadLine != null)
                ? Text("DeadLine: ${task.deadLine!.toIso8601String()}",
                    style: const TextStyle(
                      fontSize: 40.00,
                    ))
                : const Text(
                    "No Deadline assigned",
                    style: TextStyle(
                      fontSize: 40.00,
                    ),
                  ),
            // SHOW STATUS DEPENDING ON TASK COMPLETED OR NOT COMPLETED.
            (task.complete)
                ? const Text("STATUS: COMPLETED",
                    style: TextStyle(
                      fontSize: 40.00,
                      color: Color.fromARGB(255, 102, 187, 106),
                    ))
                : const Text("STATUS: INCOMPLETE",
                    style: TextStyle(
                      fontSize: 40.00,
                      color: Color.fromARGB(255, 173, 67, 67),
                    ))
          ],
        ),
      ),
      // floatingActionButton ROW WITH TWO BUTTONS.
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // EDIT TASK BUTTON
          FloatingActionButton(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (BuildContext context) =>
                    EditTaskPopUp(client: widget.client, task: widget.task),
              );
              // UPDATES STATE AFTER EditTaskPopUp
              setState(() {});
            },
            backgroundColor: Colors.lightBlue[900],
            child: const Icon(
              Icons.edit,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 30),
          // DELETE TASK BUTTON
          FloatingActionButton(
            onPressed: () async {
              await deleteTask(task);

              if (!context.mounted) return;
              Navigator.pop(context);
            },
            backgroundColor: Colors.lightBlue[900],
            child: const Icon(
              Icons.delete_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

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
