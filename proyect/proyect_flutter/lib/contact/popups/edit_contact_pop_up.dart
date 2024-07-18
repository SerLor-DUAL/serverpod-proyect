import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';

class EditContactPopUp extends StatefulWidget {
  // THIS CreateTaskPopUp ALWAYS WILL NEED THE CLIENT TO OPERATE WITH DB
  // AND userID TO WORK FOR THAT USER.
  final Client client;
  final Contact contact;

  const EditContactPopUp(
      {super.key, required this.client, required this.contact});
  @override
  EditContactPopUpState createState() => EditContactPopUpState();
}

class EditContactPopUpState extends State<EditContactPopUp> {
  // CONTROLLERS
  final TextEditingController _nameCon = TextEditingController();
  final TextEditingController _phoneCon = TextEditingController();

  // TAKES CONTROLLER'S DATA AND CREATE A TASK
  Contact updateContactWithData() {
    Contact updatedContact = widget.contact;
    updatedContact.name = (_nameCon.text == '')? updatedContact.name : _nameCon.text;
    updatedContact.phoneNumber = (_phoneCon.text == '')? updatedContact.phoneNumber : _phoneCon.text;
    return updatedContact;
  }

  

  // IF THERE'S NO ERROR IN THE TASK. CREATES THE TASK IN THE DB,
  // ELSE POPUP ErrorAlertDialog
  Future<void> updateContact() async {
    //TODO: Add error when Phone is already in the contact list.
    Contact updatedContact = updateContactWithData();
    await widget.client.contact.updateContact(updatedContact);
  }

// ----------------------- BUILDER ------------------------------ //
  @override
  Widget build(BuildContext context) {
    // RETURNS ALERTDIALOG
    return AlertDialog(
      title: const Text('Edit contact'),
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
            await updateContact();

            if (!context.mounted) return;
            Navigator.pop(context);
          },
          child: const Text('Edit'),
        ),
      ],
    );
  }
}
