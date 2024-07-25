part of '../presentation/to_do_list.dart';

abstract class ToDoListController extends State<ToDoList> {

  @override
  void dispose() {
    _titleCon.dispose();
    _descriptionCon.dispose();
    _dateCon.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loadTask();
  }

  // CONTROLLERS
  final TextEditingController _titleCon = TextEditingController();
  final TextEditingController _descriptionCon = TextEditingController();
  final TextEditingController _dateCon = TextEditingController();

  // LIST OF TASKS
  List<Task> _taskList = [];

// TAKES CONTROLLER'S DATA AND CREATE A TASK
  Task createTaskWithData() {
    return Task(
        title: _titleCon.text,
        description: _descriptionCon.text,
        deadLine: (_dateCon.text != '') ? DateTime.parse(_dateCon.text) : null,
        complete: false,
        userID: widget.user.id!);
  }

  // CHECKS IF ERROR EXISTS
  Map<String, String>? checkIfError() {
    Map<String, String>? error;
    if (_titleCon.text.isEmpty) {
      
      error = {
        'errorTitle' : 'Error with Title',
        'errorMessage': 'Title cannot be empty.',
      } ;
    }
    if (_dateCon.text != '' && !isTaskDateMatch(_dateCon.text)){
      error = {
        'errorTitle' : 'Error with Date',
        'errorMessage': 'Date is not valid.',
      };
    }
    return error;
  }

  // IF THERE'S NO ERROR IN THE TASK. CREATES THE TASK IN THE DB, ELSE POPUP ErrorAlertDialog
  Future<void> createTask() async {
    Map<String, String>? error = checkIfError();

    if (error == null) {
      Task newTask = createTaskWithData();
      await widget.client.tasks.addTask(newTask);
      if (mounted) {
        Navigator.of(context).pop();
      }
    } else {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CustomAlertDialog(
            customTitle: "${error['errorTitle']}",
            customContent: "${error['errorMessage']}"),
      );
    }
  }

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


  // CUSTOM INPUT DIALOG FOR CREATION OF TASKS
  Future<void> _askForToDoInput() async {
    _dateCon.text = '';
    _descriptionCon.text = '';
    _titleCon.text = '';
    await showDialog(
      context: context,
      builder: (BuildContext context) => CustomInputDialog(
        client: widget.client,
        user: widget.user, 
        title: 'Create Task', 
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
               await createTask();
               Navigator.of(context).pop();
            },
            child: const Text('Add Task'),
          ),
        ],
      ),
    );
    _loadTask();
  }
  // RETURNS TRUE IF THE DATE IS A MATCH
  static bool isTaskDateMatch(String taskDate) {
    RegExp exp = RegExp(r'^(?:19|20)\d{2}-(?:0[1-9]|1[0-2])-(?:0[1-9]|[12]\d|3[01])$');
    return exp.hasMatch(taskDate);
  }
}
