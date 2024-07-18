import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import 'package:proyect_flutter/main.dart';
import '../../alertdialogs/error_alert_dialog.dart';

class CreateContactPopUp extends StatefulWidget {
  // THIS CreateTaskPopUp ALWAYS WILL NEED THE CLIENT TO OPERATE WITH DB
  // AND userID TO WORK FOR THAT USER.
  final Client client;
  final int userID;

  const CreateContactPopUp(
      {super.key, required this.client, required this.userID});
  @override
  CreateContactPopUpState createState() => CreateContactPopUpState();
}

class CreateContactPopUpState extends State<CreateContactPopUp> {
  // CONTROLLERS
  final TextEditingController _nameCon = TextEditingController();
  final TextEditingController _phoneCon = TextEditingController();

  // TAKES CONTROLLER'S DATA AND CREATE A TASK
  Contact createContactWithData() {
    return Contact(
        name: _nameCon.text,
        phoneNumber: _phoneCon.text,
        userID: widget.userID);
  }

  // CHECKS IF ERROR EXISTS
  Future<Map<String, String>?> checkIfError() async{
    String errorTitle = '';
    String errorMessage = '';

    if (_nameCon.text == '') {
      errorTitle += 'name ';
      errorMessage += 'name is empty \n';
    }
    if (_phoneCon.text == '') {
      errorTitle += 'phone ';
      errorMessage += 'phone is empty \n';
    }
    bool isContactOnList = await client.contact.isContactOnList(_phoneCon.text);
    if (isContactOnList) {
      errorTitle = 'Contact already in your list';
      errorMessage = 'That contact is already in your list';
    }

    if (errorTitle == '' && errorMessage == ''){
      return null;
    }
    return {
      "errorTitle" : "Error with: $errorTitle",
      "errorMessage" : errorMessage
    };
  }

  // IF THERE'S NO ERROR IN THE TASK. CREATES THE TASK IN THE DB,
  // ELSE POPUP ErrorAlertDialog
  Future<void> createContact() async {
    Map<String, String>? error = await checkIfError();
    if (error != null) {
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorAlertDialog(
              errorTitle: error["errorTitle"]!,
              errorContent: error["errorMessage"]!,
            );
          });
      return;
    }
    Contact newContact = createContactWithData();

    await widget.client.contact.addContact(newContact);
  }

// ----------------------- BUILDER ------------------------------ //
  @override
  Widget build(BuildContext context) {
    // RETURNS ALERTDIALOG
    return AlertDialog(
      title: const Text('Create a new contact'),
      // COLUMN
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // NAME TEXTFIELD
          TextField(
            controller: _nameCon,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
          // PHONE TEXTFIELD
          TextField(
            controller: _phoneCon,
            decoration: const InputDecoration(
              labelText: 'Phone',
            ),
          ),
         
        ],
      ),
      // ACTION -- SUBMIT
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            // IF EVERYTHING OKAY. CREATE TASK, ELSE
            // RETURN ERROR AND CLOSE
            await createContact();

            if (!context.mounted) return;
            Navigator.pop(context);
          },
          child: const Text('Add Task'),
        ),
      ],
    );
  }
}
