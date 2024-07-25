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

class _ToDoList extends ToDoListController with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _addTask() async {
    await _askForToDoInput();
  }

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
        appBar: AppBar(
          flexibleSpace: Container(
            height: 20,
            color: Colors.white,
          ),
          automaticallyImplyLeading: false,
          title: const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              "To Do List",
              style: TextStyle(color: Colors.white),
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF369DD8),
          toolbarHeight: 96,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(76),
            child: Stack(
              children: [
                MouseRegion(
                  onEnter: (_) {
                    setState(() {});
                  },
                  onExit: (_) {
                    setState(() {});
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: TabBar(
                      controller: _tabController,
                      labelColor: const Color(0xFF369DD8),
                      indicatorColor: const Color(0xFF369DD8),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 2,
                      tabs: const [
                        Tab(
                          icon: Icon(
                            Icons.message,
                            color: Color(0xFF369DD8),
                          ),
                          text: "Add Task",
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: GestureDetector(
                    onTap: _addTask,
                    behavior: HitTestBehavior
                        .translucent, // Asegura que se capture cualquier clic
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 500),
              child: ListView.builder(
                itemCount: _taskList.length,
                itemBuilder: (BuildContext context, int index) {
                  Task task = _taskList[index];

                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  widget.selectTask(task);
                                  widget.updateHomeIndex(5);
                                  _loadTask();
                                },
                                child: HoverableTaskTitle(
                                  task: task,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        IconButton(
                          onPressed: () async {
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
                        const SizedBox(width: 20),
                        IconButton(
                          onPressed: () async {
                            await deleteTask(task);
                          },
                          icon: const Icon(Icons.delete_forever),
                          tooltip: 'Delete',

                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
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
