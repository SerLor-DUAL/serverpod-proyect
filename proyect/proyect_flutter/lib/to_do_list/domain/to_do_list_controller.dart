part of '../presentation/to_do_list.dart';

abstract class ToDoListController extends State<ToDoList> {

  // TEXT CONTROLLERS
  final TextEditingController _titleCon = TextEditingController();
  final TextEditingController _descriptionCon = TextEditingController();
  final TextEditingController _dateCon = TextEditingController();

  // TASK LIST
  List<Task> _taskList = [];

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

  // ----------------------------------- UPDATE --------------------------------------//

  // SELECTED DATA FROM TEXT INPUTS TO UPDATE TASK
  Task editTaskWithData(Task selectedTask) {
    selectedTask.title = (_titleCon.text != '') ? _titleCon.text : selectedTask.title;
    selectedTask.description = (_descriptionCon.text != '') ? _descriptionCon.text : selectedTask.description;
    selectedTask.deadLine = (_dateCon.text != '') ? DateTime.parse(_dateCon.text) : selectedTask.deadLine;
    return selectedTask;
  }

  // UPDATE TASK
  Future<void> _updateTask(Task selectedTask) async {
    Map<String, String>? error = checkIfError();
    if (error == null) {
      Task editedTask = editTaskWithData(selectedTask);
      await widget.client.tasks.updateTask(editedTask);
      if (mounted) {
        Navigator.of(context).pop();
      }
    } else {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CustomAlertDialog(
          customTitle: "${error['errorTitle']}",
          customContent: "${error['errorMessage']}",
        ),
      );
    }
    _loadTask();
  }
  // UPDATE TASK POP UP CONTRUCTOR
  Future<void> _askForUpdateToDoInput(Task selectedTask) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => CustomInputDialog(
        client: widget.client,
        title: 'Edit Task',
        buttonInTextFields: const [2],
        content: null,
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
              await _updateTask(selectedTask);
            },
            child: const Text('Edit Task'),
          ),
        ],
      ),
    );
  }

  // ----------------------------------- DELETE --------------------------------------//

  // DELETE TASK
  Future<void> _deleteTask(Task task) async {
    await widget.client.tasks.deleteTask(task);
    _loadTask();
  }

  // ----------------------------------- CREATE --------------------------------------//

  // SELECTED DATA FROM TEXT INPUTS TO CREATE TASK
  Task createTaskWithData() {
    return Task(
      title: _titleCon.text,
      description: _descriptionCon.text,
      deadLine: (_dateCon.text != '') ? DateTime.parse(_dateCon.text) : null,
      complete: false,
      userID: widget.user.id!,
    );
  }

  // CREATE TASK
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
          customContent: "${error['errorMessage']}",
        ),
      );
    }
    _loadTask();
  }

  // CREATE TASK POP UP CONTRUCTOR
  Future<void> _askForToDoInput() async {
    _dateCon.text = '';
    _descriptionCon.text = '';
    _titleCon.text = '';
    await showDialog(
      context: context,
      builder: (BuildContext context) => CustomInputDialog(
        client: widget.client,
        user: widget.user,
        buttonInTextFields: const [2],
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
            },
            child: const Text('Add Task'),
          ),
        ],
      ),
    );
  }

  // ----------------------------------- GENERAL USE --------------------------------------//

  // LOAD TASKS LIST FOR THAT USER
  void _loadTask() async {
    final List<Task> taskList = await widget.client.tasks.getEveryTaskByUser(widget.user.id!);
    setState(() {
      _taskList = taskList;
    });
  }

  // CHANGE COMPLETE STATUS
  void _toogleCompleted(Task task) async {
    task.complete = !task.complete;
    await widget.client.tasks.updateTask(task);
    setState(() {});
  }

  // CHECK IF TEXT INPUTS ARE OKAY
  Map<String, String>? checkIfError() {
    Map<String, String>? error;
    if (_titleCon.text.isEmpty) {
      error = {
        'errorTitle': 'Error with Title',
        'errorMessage': 'Title cannot be empty.',
      };
    }
    if (_dateCon.text != '' && !isTaskDateMatch(_dateCon.text)) {
      error = {
        'errorTitle': 'Error with Date',
        'errorMessage': 'Date is not valid.',
      };
    }
    return error;
  }

  // FORMATED DATA
  String getFormatedDate(Task task) {
    if (task.deadLine != null){
      return task.deadLine.toString().substring(0,10);
    }
    return '';
  }

  // REGEX FOR MANUAL DATE INPUT
  static bool isTaskDateMatch(String taskDate) {
    RegExp exp = RegExp(r'^(?:19|20)\d{2}-(?:0[1-9]|1[0-2])-(?:0[1-9]|[12]\d|3[01])$');
    return exp.hasMatch(taskDate);
  }
}
