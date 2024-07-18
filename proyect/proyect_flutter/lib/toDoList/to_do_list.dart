import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import '../log-reg/error_alert_dialog.dart';
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
    final List<Task> taskList = await widget.client.tasks.getEveryTask(widget.userId);
    setState(() {
      _taskList = taskList; 
    });
  }

  // Creates tasks for userId in widget.
  void createTask() async{
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
  void toogleCompleted(Task task) async{
    task.complete = !task.complete;
    await widget.client.tasks.updateTask(task);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
                  "IntegraQS ToDoList",
                  style: TextStyle(
                    color: Colors.white
                  )),
          centerTitle: true,
          backgroundColor: Colors.lightBlue[900],
        ),
      body: ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _taskList.length,
      itemBuilder: (BuildContext context, int index){

        Task task = _taskList[index];

          return ListTile(
          title: Row(
            children: [
              // Left side: Title
              Expanded(
                child: Text(
                  task.title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    decoration: (task.complete)? TextDecoration.lineThrough : null
                  ),
                ),
              ),
              // Right side: Icons
              IconButton(
                onPressed: () {
                  toogleCompleted(task);
                },
                icon: Icon(
                        // If task is not completed. The button is outlined.
                        ((task.complete)?
                            Icons.brightness_1 :
                            Icons.brightness_1_outlined),
                        color: const Color.fromARGB(255, 124, 214, 255)),
                tooltip: 'Complete/Uncomplete',
              ),
              IconButton(
                onPressed: () async {
                  // Push TaskDetails
                  await Navigator.push(context, MaterialPageRoute(
                                                  builder: (context) => TaskDetails(
                                                                                    task: task,
                                                                                    client: widget.client,
                                                                                      )
                                                )
                  );
                  _loadTask();
                },
                icon: const Icon(
                        (Icons.arrow_forward_ios),
                        color: Color.fromARGB(255, 1, 3, 3)),
                tooltip: 'See details',
              ),
            ],
          ),
        );
      },
    ),
    floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
              context: context,
              builder: (BuildContext context) => CreateTaskPopUp(
                                                        client: widget.client,
                                                        userID: widget.userId,),
            );
          _loadTask();
          },
        backgroundColor: Colors.lightBlue[900],
        child: const Icon(
                  Icons.add,
                  color: Colors.white,),
          ),
      );
  }
}

class CreateTaskPopUp extends StatefulWidget {
  final Client client;
  final int userID;

  const CreateTaskPopUp({super.key, required this.client, required this.userID}); 
  @override
  CreateTaskPopUpState createState() => CreateTaskPopUpState();
}

class CreateTaskPopUpState extends State<CreateTaskPopUp> {
  final TextEditingController _titleCon = TextEditingController();
  final TextEditingController _descriptionCon = TextEditingController();
  final TextEditingController _dateCon = TextEditingController();

  Task createTaskWithData() {
    return Task(
              title: _titleCon.text,
              description: _descriptionCon.text,
              deadLine: (_dateCon.text != '')? DateTime.parse(_dateCon.text) : null,
              complete: false,
              userID: widget.userID
              );
    }
  
  String checkIfError() {
    String error = '';

    if (_titleCon.text == '') {
      error += 'Title';
    }
    return error;

  }
  

  Future<void> createTask() async{
    String error = checkIfError();

    if (error == '') {
      Task newTask = createTaskWithData();
      await widget.client.tasks.addTask(newTask);
    }
    else {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return ErrorAlertDialog(
            errorTitle: 'Error in $error',
            errorContent: '$error cannot be empty.',
          );
        }
      );
      return;
    }

  }



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create a new task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleCon,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          TextField(
            controller: _descriptionCon,
            decoration: const InputDecoration(
              labelText: 'Description',
            ),
          ),
          TextField(
            controller: _dateCon,
            decoration: const InputDecoration(
              labelText: 'DeadLine',
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () async{
            // Create task and go back to the previous page.
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


