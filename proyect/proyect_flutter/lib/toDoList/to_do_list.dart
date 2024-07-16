import 'package:flutter/material.dart';
import 'task_details.dart';
import 'task.dart';



class ToDoList extends StatefulWidget {
  final List<Task> taskList = [
      Task(title: "Tengo tarea", descrip: "Esta es la tarea 1", completed: true), 
      Task(title: "Tengo tarea 2", descrip: "Esta es la tarea 2", completed: false)];
 

  ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  
  // Change completed task.
  void toogleCompleted(Task task) {
    setState(() {
      task.completed = !task.completed;
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
      itemCount: widget.taskList.length,
      itemBuilder: (BuildContext context, int index){

        Task task = widget.taskList[index];

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
                        ((task.completed)?
                            Icons.brightness_1 :
                            Icons.brightness_1_outlined),
                        color: const Color.fromARGB(255, 124, 214, 255)),
                tooltip: 'Complete/Uncomplete',
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TaskDetails(
                                                                                            task: task,
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
    )
    );
  }
}




