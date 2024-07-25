import 'package:flutter/material.dart';
import 'package:proyect_client/proyect_client.dart';
import 'package:proyect_flutter/common/ui/custom_alert_dialog.dart';
import 'package:proyect_flutter/common/ui/custom_input_dialog.dart';

part '../domain/to_do_list_controller.dart';

class ToDoList extends StatefulWidget {
  final Client client;
  final UsersRegistry user;

  final void Function(int)
      updateHomeIndex; // Función de callback para actualizar el índice
  final void Function(Task)
      selectTask; // Función de callback para seleccionar task

  const ToDoList(
      {super.key,
      required this.client,
      required this.user,
      required this.selectTask,
      required this.updateHomeIndex});

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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            widget.selectTask(task);
                            widget.updateHomeIndex(5);
                            _loadTask();
                          },
                          child: HoverableTaskTitle(task: task,)
                        ),
                        const SizedBox(width: 20),
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
            await _askForToDoInput();
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

// ------------------------ HoverableTaskTitle ------------------------- \\

class HoverableTaskTitle extends StatefulWidget {
  final Task task;

  const HoverableTaskTitle({
    super.key,
    required this.task,
  });

  @override
  createState() => _HoverableTaskTitle();
}

class _HoverableTaskTitle extends State<HoverableTaskTitle> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Text(
        widget.task.title,
        style: TextStyle(
          fontSize: 23.0,
          fontWeight: isHovered ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
