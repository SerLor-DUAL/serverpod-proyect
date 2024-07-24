import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import 'package:proyect_flutter/common/ui/custom_input_dialog.dart';
import 'package:proyect_flutter/main.dart';
part '../domain/to_do_task_details_controller.dart';

class TaskDetails extends StatefulWidget {
  // NEEDS A TASK TO EDIT AND CLIENT TO WORK WITH DB
  final Task task;
  final Client client;

  const TaskDetails({super.key, required this.task, required this.client});

  @override
  createState() => _TaskDetails();
}

class _TaskDetails extends TaskDetailsController {
// ----------------------- BUILDER ------------------------------ //
  @override
  Widget build(BuildContext context) {
    // WE SET THE TASK WE WILL WORK ON.
    Task task = widget.task;

    return Scaffold(
      // APPBAR
      appBar: AppBar(
        title: Text(task.title, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[900],
      ),
      // BODY : CENTERED COLUMN
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // IF TASK DOES HAVE A DESCRIPTION ADD IT.
            (task.description != null)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("Description:",
                          style: TextStyle(
                            fontSize: 40.00,
                          )),
                      Text(task.description!,
                          style: const TextStyle(
                            fontSize: 20.00,
                          )),
                    ],
                  )
                :
                // IF TASK DOESN'T EXISTS. DON'T SHOW NULL
                const Text("There's no description",
                    style: TextStyle(
                      fontSize: 40.00,
                    )),

            // IF TASK DOES HAVE A DEADLINE ADD IT. ELSE DONT.
            (task.deadLine != null)
                ? Text("DeadLine: ${task.deadLine!.toIso8601String()}",
                    style: const TextStyle(
                      fontSize: 40.00,
                    ))
                : const Text(
                    "No Deadline assigned",
                    style: TextStyle(
                      fontSize: 40.00,
                    ),
                  ),
            // SHOW STATUS DEPENDING ON TASK COMPLETED OR NOT COMPLETED.
            (task.complete)
                ? const Text("STATUS: COMPLETED",
                    style: TextStyle(
                      fontSize: 40.00,
                      color: Color.fromARGB(255, 102, 187, 106),
                    ))
                : const Text("STATUS: INCOMPLETE",
                    style: TextStyle(
                      fontSize: 40.00,
                      color: Color.fromARGB(255, 173, 67, 67),
                    ))
          ],
        ),
      ),
      // floatingActionButton ROW WITH TWO BUTTONS.
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // EDIT TASK BUTTON
          FloatingActionButton(
            onPressed: () async {
              await _askForUpdateToDoInput();
              // UPDATES STATE AFTER EditTaskPopUp
              setState(() {});
            },
            backgroundColor: Colors.lightBlue[900],
            child: const Icon(
              Icons.edit,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 30),
          // DELETE TASK BUTTON
          FloatingActionButton(
            onPressed: () async {
              await deleteTask(task);
              if (!context.mounted) return;
              Navigator.pop(context);
            },
            backgroundColor: Colors.lightBlue[900],
            child: const Icon(
              Icons.delete_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
