import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import 'package:proyect_flutter/main.dart';
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

  Future<void> _loadTask() async {
    final List<Task> taskList = await client.tasks.getEveryTask(1);
    setState(() {
      _taskList = taskList; 
    });
  }

  Future<void> createTask() async{
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
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
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
                                                                                            client: client,
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
          await createTask();
          },
        backgroundColor: Colors.lightBlue[900],
        child: const Icon(
                  Icons.add,
                  color: Colors.white,),
          ),
      );
  }
}




