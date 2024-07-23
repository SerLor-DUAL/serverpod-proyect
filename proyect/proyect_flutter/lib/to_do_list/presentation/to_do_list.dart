import 'package:flutter/material.dart';
import 'package:proyect_client/proyect_client.dart';
import 'to_do_task_details.dart';
import 'pop_up_create_to_do_task.dart';

part '../domain/to_do_list_controller.dart';

class ToDoList extends StatefulWidget {
  final Client client;
  final UsersRegistry user;

  const ToDoList({
    super.key,
    required this.client,
    required this.user,
  });

  @override
  createState() => _ToDoList();
}

class _ToDoList extends ToDoListController {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(3, 0),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
      ),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 20.0,
              color: Colors.white,
            ),
            // AppBar
            AppBar(
              automaticallyImplyLeading: false,
              title: const Text(
                "To Do List",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              backgroundColor: const Color(0xFF369DD8),
              toolbarHeight: 78,
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: _taskList.length,
                itemBuilder: (BuildContext context, int index) {
                  Task task = _taskList[index];
                  return ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            task.title,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              decoration: (task.complete)
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            toogleCompleted(task);
                          },
                          icon: Icon(
                            task.complete
                                ? Icons.brightness_1
                                : Icons.brightness_1_outlined,
                            color: const Color.fromARGB(255, 124, 214, 255),
                          ),
                          tooltip: 'Complete/Uncomplete',
                        ),
                        IconButton(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TaskDetails(
                                  task: task,
                                  client: widget.client,
                                ),
                              ),
                            );
                            _loadTask();
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromARGB(255, 1, 3, 3),
                          ),
                          tooltip: 'See details',
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        // FLOATING ACTION BUTTON
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            _askForToDoInput();
          },
          backgroundColor: Colors.lightBlue[900],
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}