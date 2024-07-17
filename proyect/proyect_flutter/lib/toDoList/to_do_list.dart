import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';

import 'task_details.dart';
class ToDoList extends StatefulWidget {
  
  final Client client;

  const ToDoList({super.key, required this.client});

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

  void _loadTask() async {
    final List<Task> taskList = await widget.client.tasks.getEveryTask(1);
    setState(() {
      _taskList = taskList; 
    });
  }

  void createTask() async{
    Task task = Task(
      title: "Hola",
      description: "Holaaa",
      deadLine: DateTime.now(),
      complete: false,
      userID: 1
    );
    await widget.client.tasks.addTask(task);
    _loadTask();
  }

  // Change completed task.
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
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TaskDetails(
                                                                                            task: task,
                                                                                            client: widget.client,
                                                                                              )
                                          )
                  );
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
                                                        client: widget.client),
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
  Client client;

  CreateTaskPopUp({super.key, required this.client}); 
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
              deadLine: DateTime.parse(_dateCon.text),
              complete: false,
              userID: 1
              );
    
    }
  

  Future<void> createTask() async{
    Task newTask = createTaskWithData();
    await widget.client.tasks.addTask(newTask);
    
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


