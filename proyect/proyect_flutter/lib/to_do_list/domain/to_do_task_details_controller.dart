part of '../presentation/to_do_task_details.dart';

abstract class TaskDetailsController extends State<TaskDetails> {

  // CONTROLLERS
  final TextEditingController _titleCon = TextEditingController();
  final TextEditingController _descriptionCon = TextEditingController();
  final TextEditingController _dateCon = TextEditingController();

// EDIT THE SELECTED TASK. CHANGING, JUST IF THE USER WANTED TO, THE TITLE, DESCRIPTION AND/OR DEADLINE.
  Task editTaskWithData() {
    Task task = widget.task;
    task.title = (_titleCon.text != '') ? _titleCon.text : task.title;
    task.description =
        (_descriptionCon.text != '') ? _descriptionCon.text : task.description;
    task.deadLine =
        (_dateCon.text != '') ? DateTime.parse(_dateCon.text) : task.deadLine;

    return task;
  }

  // UPDATE THE TASK IN THE DB.
  Future<void> updateTask() async {
    Task newTask = editTaskWithData();
    await widget.client.tasks.updateTask(newTask);
  }

// DELETE TASK
  Future<void> deleteTask(Task task) async {
    await client.tasks.deleteTask(task);
  }

 // CUSTOM INPUT DIALOG FOR UPDATE OF TASKS
 Future<void>_askForUpdateToDoInput() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => CustomInputDialog(
        client: widget.client,
        title: 'Edit Task', 
        content: null, // NO QUIERO CONTENIDO AQUÍ
        textControllers: [_titleCon, _descriptionCon, _dateCon],
        labels: const ['Title', 'Description', 'Deadline (YYYY-MM-DD)'],
         actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
               await updateTask();
               Navigator.of(context).pop();
            },
            child: const Text('Edit Task'),
          ),
        ],
      ),
    );
  }

  // ------------------------ FORMAT METHODS ------------------------- \\
  String getFormatedDate(Task task) {
    return task.deadLine.toString().substring(0,10);
  }
}