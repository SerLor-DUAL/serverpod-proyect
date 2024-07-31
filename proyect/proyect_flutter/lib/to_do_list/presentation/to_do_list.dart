import 'package:flutter/material.dart';
import 'package:proyect_client/proyect_client.dart';
import 'package:proyect_flutter/common/ui/custom_alert_dialog.dart';
import 'package:proyect_flutter/common/ui/custom_input_dialog.dart';
part '../domain/to_do_list_controller.dart';

class ToDoList extends StatefulWidget {
  final Client client;
  final UsersRegistry user;

  // FUNCIÓN DE CALLBACK PARA SELECCIONAR TASK
  final void Function(Task) selectTask;

  const ToDoList(
      {super.key,
      required this.client,
      required this.user,
      required this.selectTask});

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
          toolbarHeight: 98,
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
                    // ASEGURA QUE SE CAPTURE CUALQUIER CLIC
                    behavior: HitTestBehavior.translucent,
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
              padding:
                  const EdgeInsets.symmetric(vertical: 50, horizontal: 500),
              child: ListView.builder(
                itemCount: _taskList.length,
                itemBuilder: (BuildContext context, int index) {
                  Task task = _taskList[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ExpandableTaskItem(
                      task: task,
                      selectTask: widget.selectTask,
                      toogleCompleted: _toogleCompleted,
                      deleteTask: _askForDeleteConfirmation,
                      updateTask: _askForUpdateToDoInput,
                      getFormatedDate: _getFormatedDate,
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

// ------------------------ ExpandableTaskItem ------------------------- \\

class ExpandableTaskItem extends StatefulWidget {
  final Task task;
  final void Function(Task) selectTask;
  final void Function(Task) toogleCompleted;
  final Future<void> Function(Task) deleteTask;
  final Future<void> Function(Task) updateTask;
  final String Function(Task) getFormatedDate;

  const ExpandableTaskItem({
    super.key,
    required this.task,
    required this.selectTask,
    required this.toogleCompleted,
    required this.deleteTask,
    required this.updateTask,
    required this.getFormatedDate,
  });

  @override
  createState() => _ExpandableTaskItemState();
}

class _ExpandableTaskItemState extends State<ExpandableTaskItem> {
  // MANAGE THE HOVERING STATE
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hasDescription = widget.task.description?.isNotEmpty ?? false;

    return GestureDetector(
      child: MouseRegion(
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
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(vertical: isHovered ? 20.0 : 15.0),
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF369DD8)),
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(120, 54, 157, 216),
                blurRadius: 3.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  widget.task.title,
                  style: TextStyle(
                    fontSize: 23.0,
                    color: const Color(0xFF369DD8),
                    fontWeight: isHovered ? FontWeight.bold : FontWeight.normal,
                    decoration: widget.task.complete
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                subtitle: widget.task.complete
                    ? const Text(
                        'Completed Task',
                        style: TextStyle(
                          color: Color(0xFF369DD8),
                        ),
                      )
                    : widget.getFormatedDate(widget.task).isNotEmpty
                        ? Text(
                            'Due Date: ${widget.getFormatedDate(widget.task)}',
                            style: const TextStyle(
                              color: Color(0xFF369DD8),
                            ),
                          )
                        : null,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () async {
                        widget.toogleCompleted(widget.task);
                      },
                      icon: Icon(
                        widget.task.complete
                            ? Icons.brightness_1
                            : Icons.brightness_1_outlined,
                        color: const Color.fromARGB(255, 124, 214, 255),
                        size: 30,
                      ),
                      tooltip: 'Complete/Uncomplete',
                    ),
                    IconButton(
                      onPressed: () async {
                        await widget.updateTask(widget.task);
                      },
                      icon: const Icon(
                        Icons.edit_rounded,
                        size: 30,
                      ),
                      tooltip: 'Edit',
                    ),
                    IconButton(
                      onPressed: () async {
                        await widget.deleteTask(widget.task);
                      },
                      icon: const Icon(
                        Icons.delete_forever,
                        size: 30,
                      ),
                      tooltip: 'Delete',
                    ),
                  ],
                ),
              ),
              if (isHovered && hasDescription)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(widget.task.description ?? 'No Description'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
