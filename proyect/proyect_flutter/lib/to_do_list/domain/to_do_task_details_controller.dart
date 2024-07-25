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
  // CHECKS IF ERROR EXISTS
  Map<String, String>? checkIfError() {
    Map<String, String>? error;
    if (_dateCon.text != '' && !isTaskDateMatch(_dateCon.text)){
      error = {
        'errorTitle' : 'Error with Date',
        'errorMessage': 'Date is not valid.',
      };
    }
    return error;
  }

  // UPDATE THE TASK IN THE DB.
  Future<void> updateTask() async {
    Map<String, String>? error = checkIfError();
    if (error == null) {
      Task newTask = editTaskWithData();
      await widget.client.tasks.updateTask(newTask);
    }
    else {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CustomAlertDialog(
            customTitle: "${error['errorTitle']}",
            customContent: "${error['errorMessage']}"),
      );
    }
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
  // RETURNS TRUE IF THE DATE IS A MATCH
  static bool isTaskDateMatch(String taskDate) {
    RegExp exp = RegExp(r'^(?:19|20)\d{2}-(?:0[1-9]|1[0-2])-(?:0[1-9]|[12]\d|3[01])$');
    return exp.hasMatch(taskDate);
  }
  
}