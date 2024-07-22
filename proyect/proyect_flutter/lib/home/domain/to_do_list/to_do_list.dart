import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import 'task_details.dart';
import 'popups/create_task_pop_up.dart';

class ToDoList extends StatefulWidget {
  final Client client;
  final UsersRegistry user;
  const ToDoList({super.key, required this.client, required this.user});

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
        await widget.client.tasks.getEveryTaskByUser(widget.user.id!);
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
      userID: widget.user.id!,
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
        automaticallyImplyLeading: false,
        title: Text("${widget.user.userName} - ToDoList",
            style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 124, 214, 255),
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
              userID: widget.user.id!,
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
