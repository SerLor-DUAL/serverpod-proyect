part of '../presentation/to_do_list.dart';

abstract class ToDoListController extends State<ToDoList> {
  List<Task> _taskList = [];

// LOAD EVERYTASK FROM USERID IN WIDGET.
  void _loadTask() async {
    final List<Task> taskList =
        await widget.client.tasks.getEveryTaskByUser(widget.user.id!);
    setState(() {
      _taskList = taskList;
    });
  }

  // INVERT TASK'S COMPLETE ATTRIBUTE.
  void toogleCompleted(Task task) async {
    task.complete = !task.complete;
    await widget.client.tasks.updateTask(task);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadTask();
  }

  void _askForToDoInput() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => CreateTaskPopUp(
        client: widget.client,
        userID: widget.user.id!,
      ),
    );
    _loadTask();
  }
}
