part of '../presentation/pop_up_edit_to_do_task.dart';

abstract class EditTaskPopUpController extends State<EditTaskPopUp> {
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
}
