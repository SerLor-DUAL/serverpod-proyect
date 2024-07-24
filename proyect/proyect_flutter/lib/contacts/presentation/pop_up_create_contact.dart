import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import 'package:proyect_flutter/main.dart';
import '../../common/ui/custom_alert_dialog.dart';
part '../domain/pop_up_create_contact_controller.dart';

class CreateContactPopUp extends StatefulWidget {
  // THIS CreateTaskPopUp ALWAYS WILL NEED THE CLIENT TO OPERATE WITH DB
  // AND userID TO WORK FOR THAT USER.
  final Client client;
  final int userID;

  const CreateContactPopUp(
      {super.key, required this.client, required this.userID});
  @override
  createState() => _CreateContactPopUp();
}

class _CreateContactPopUp extends CreateContactPopUpController {
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
                'ADD A NEW CONTACT',
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
                    controller: _nameCon,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 54, 157, 216),
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Name',
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
                    controller: _phoneCon,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 54, 157, 216),
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Phone',
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
                              textStyle: const TextStyle(fontSize: 25.0),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              backgroundColor: Colors.white,
                              foregroundColor:
                                  const Color.fromARGB(255, 54, 157, 216),
                              shadowColor:
                                  const Color.fromARGB(255, 54, 157, 216),
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
                              await createContact();
                              if (!context.mounted) return;
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 25.0),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              backgroundColor: Colors.white,
                              foregroundColor:
                                  const Color.fromARGB(255, 54, 157, 216),
                              shadowColor:
                                  const Color.fromARGB(255, 54, 157, 216),
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
                              'Add Contact',
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
          ],
        ),
      ),
    );
  }
}
