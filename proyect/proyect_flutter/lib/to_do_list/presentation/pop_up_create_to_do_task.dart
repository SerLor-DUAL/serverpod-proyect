import 'package:flutter/material.dart';
import 'package:proyect_client/proyect_client.dart';

import 'package:proyect_flutter/common/ui/error_alert_dialog.dart'
    as error_dialog;

part '../domain/pop_up_create_task_controller.dart';

class CreateTaskPopUp extends StatefulWidget {
  final Client client;
  final int userID;

  const CreateTaskPopUp({
    super.key,
    required this.client,
    required this.userID,
  });

  @override
  createState() => _CreateTaskPopUpState();
}

class _CreateTaskPopUpState extends CreateTaskPopUpController {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: const Color(0xFF369DD8),
            width: 2.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 30.0, left: 30, right: 30, bottom: 15),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFF369DD8),
                    width: 1,
                  ),
                ),
              ),
              child: const Text(
                'CREATE A NEW TASK',
                style: TextStyle(
                  color: Color(0xFF369DD8),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  TextField(
                    controller: _titleCon,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 54, 157, 216),
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 54, 157, 216),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 54, 157, 216),
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 54, 157, 216),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _descriptionCon,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 54, 157, 216),
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 54, 157, 216),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 54, 157, 216),
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 54, 157, 216),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _dateCon,
                    keyboardType: TextInputType.datetime,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 54, 157, 216),
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Deadline (YYYY-MM-DD)',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 54, 157, 216),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 54, 157, 216),
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 54, 157, 216),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 30.0, left: 30, right: 30, bottom: 10),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 30.0),
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        backgroundColor: Colors.white,
                        foregroundColor:
                            const Color.fromARGB(255, 54, 157, 216),
                        shadowColor: const Color.fromARGB(255, 54, 157, 216),
                        elevation: 3,
                        shape: ContinuousRectangleBorder(
                          side: const BorderSide(
                            color: Color.fromARGB(255, 54, 157, 216),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color.fromARGB(255, 54, 157, 216),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        await createTask();
                      },
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 30.0),
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        backgroundColor: Colors.white,
                        foregroundColor:
                            const Color.fromARGB(255, 54, 157, 216),
                        shadowColor: const Color.fromARGB(255, 54, 157, 216),
                        elevation: 3,
                        shape: ContinuousRectangleBorder(
                          side: const BorderSide(
                            color: Color.fromARGB(255, 54, 157, 216),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Add Task',
                        style: TextStyle(
                          color: Color.fromARGB(255, 54, 157, 216),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
