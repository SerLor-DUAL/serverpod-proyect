import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';



class TaskDetails extends StatefulWidget{
  final Task task;
  final Client client;

  TaskDetails({super.key, required this.task, required this.client});

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  


  @override
    Widget build(BuildContext context) {
      Task task = widget.task;

      return Scaffold(
        appBar: AppBar(
          title: Text(
                  task.title,
                  style: const TextStyle(
                    color: Colors.white
                  )
                ),
          centerTitle: true,
          backgroundColor: Colors.lightBlue[900],
        ),
        body: Center(
          child: Column(
                  mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // IF TASK DOES HAVE A DESCRIPTION ADD IT.
                    (task.description != null)?
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                        "Description:",
                        style:  TextStyle(
                          fontSize: 40.00,
                          )
                        ),
                        Text(
                        task.description!,
                        style: const TextStyle(
                          fontSize: 20.00,
                          )
                        ),
                      ],
                    ) :
                    const Text(
                        "There's no description",
                        style: TextStyle(
                          fontSize: 40.00,
                          )
                        ),
                    
                    // IF TASK DOES HAVE A DEADLINE ADD IT. ELSE DONT.
                    (task.deadLine != null) ?  
                      Text(
                        "DeadLine: ${task.deadLine!.toIso8601String()}",
                        style: const TextStyle(
                          fontSize: 40.00,
                        )
                      ) :
                      const Text(
                        "No Deadline assigned",
                        style: TextStyle(
                          fontSize: 40.00,
                        ),
                      ),
                    (task.complete)?
                      const Text(
                        "STATUS: COMPLETED",
                        style: TextStyle(
                          fontSize: 40.00,
                          color: Color.fromARGB(255, 102, 187, 106),
                        )
                      ) :
                      const Text(
                        "STATUS: INCOMPLETE",
                        style: TextStyle(
                          fontSize: 40.00,
                          color: Color.fromARGB(255, 173, 67, 67),
                        )
                      )
                  ],),
        )
      );
    }
}