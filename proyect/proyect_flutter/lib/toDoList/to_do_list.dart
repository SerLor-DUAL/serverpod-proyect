import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import 'error_alert_dialog.dart';
import 'task_details.dart';

class ToDoList extends StatefulWidget {
  final Client client;
  final int userId;
  const ToDoList({super.key, required this.client, required this.userId});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<Task> _taskList = [];

  @override
  void initState() {
    super.initState();
    _loadTask();
  }

  // Load everytask from userId in widget.
  void _loadTask() async {
    final List<Task> taskList =
        await widget.client.tasks.getEveryTask(widget.userId);
    setState(() {
      _taskList = taskList;
    });
  }

  // Creates tasks for userId in widget.
  void createTask() async {
    Task task = Task(
      title: "Hola",
      description: "Holaaa",
      deadLine: DateTime.now(),
      complete: false,
      userID: widget.userId,
    );
    await widget.client.tasks.addTask(task);
    _loadTask();
  }

  // Invert task's complete attribute.
  void toogleCompleted(Task task) async {
    task.complete = !task.complete;
    await widget.client.tasks.updateTask(task);
    setState(() {});
  }

// ----------------------- BUILDER ------------------------------ //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APPBAR
      appBar: AppBar(
        title: const Text("IntegraQS ToDoList",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[900],
      ),

      //BODY : LISTVIEW
      body: ListView.builder(
        // STYLE AND LISTVIEW SETUP.
        padding: const EdgeInsets.all(8),
        itemCount: _taskList.length,
        itemBuilder: (BuildContext context, int index) {
          Task task = _taskList[index];

          // FOR EACH ITEM - ListTile
          return ListTile(
            // TITLE: ROW
            title: Row(
              children: [
                // LEFT SIDE : TITLE
                Expanded(
                  child: Text(
                    task.title,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        decoration: (task.complete)
                            ? TextDecoration.lineThrough
                            : null),
                  ),
                ),

                // RIGHT SIDE : ICONS
                // FIRST ICONBUTTON
                IconButton(
                  onPressed: () {
                    toogleCompleted(task);
                  },
                  icon: Icon(
                      // If task is not completed. The button is outlined.
                      ((task.complete)
                          ? Icons.brightness_1
                          : Icons.brightness_1_outlined),
                      color: const Color.fromARGB(255, 124, 214, 255)),
                  tooltip: 'Complete/Uncomplete',
                ),
                // SECOND ICONBUTTON
                IconButton(
                  onPressed: () async {
                    // Push TaskDetails
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TaskDetails(
                                  task: task,
                                  client: widget.client,
                                )));
                    // AFTER EDIT, LOAD EVERY TASK AGAIN.
                    _loadTask();
                  },
                  icon: const Icon((Icons.arrow_forward_ios),
                      color: Color.fromARGB(255, 1, 3, 3)),
                  tooltip: 'See details',
                ),
              ],
            ),
          );
        },
      ),
      // FLOATING ACTION
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (BuildContext context) => CreateTaskPopUp(
              client: widget.client,
              userID: widget.userId,
            ),
          );
          _loadTask();
        },
        backgroundColor: Colors.lightBlue[900],
        // ICON AS CHILD
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class CreateTaskPopUp extends StatefulWidget {
  // THIS CreateTaskPopUp ALWAYS WILL NEED THE CLIENT TO OPERATE WITH DB
  // AND userID TO WORK FOR THAT USER.
  final Client client;
  final int userID;

  const CreateTaskPopUp(
      {super.key, required this.client, required this.userID});
  @override
  CreateTaskPopUpState createState() => CreateTaskPopUpState();
}

class CreateTaskPopUpState extends State<CreateTaskPopUp> {
  // CONTROLLERS
  final TextEditingController _titleCon = TextEditingController();
  final TextEditingController _descriptionCon = TextEditingController();
  final TextEditingController _dateCon = TextEditingController();

  // TAKES CONTROLLER'S DATA AND CREATE A TASK
  Task createTaskWithData() {
    return Task(
        title: _titleCon.text,
        description: _descriptionCon.text,
        deadLine: (_dateCon.text != '') ? DateTime.parse(_dateCon.text) : null,
        complete: false,
        userID: widget.userID);
  }

  // CHECKS IF ERROR EXISTS
  String checkIfError() {
    String error = '';

    if (_titleCon.text == '') {
      error += 'Title';
    }
    return error;
  }

  // IF THERE'S NO ERROR IN THE TASK. CREATES THE TASK IN THE DB,
  // ELSE POPUP ErrorAlertDialog
  Future<void> createTask() async {
    String error = checkIfError();

    if (error == '') {
      Task newTask = createTaskWithData();
      await widget.client.tasks.addTask(newTask);
    } else {
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorAlertDialog(
              errorTitle: 'Error in $error',
              errorContent: '$error cannot be empty.',
            );
          });
      return;
    }
  }

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
