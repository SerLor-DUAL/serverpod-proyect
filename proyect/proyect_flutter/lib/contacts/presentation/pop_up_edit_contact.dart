import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import '../../common/ui/custom_alert_dialog.dart';
part '../domain/pop_up_edit_contact_controller.dart';

class EditContactPopUp extends StatefulWidget {
  // THIS CreateTaskPopUp ALWAYS WILL NEED THE CLIENT TO OPERATE WITH DB
  // AND userID TO WORK FOR THAT USER.
  final Client client;
  final Contact contact;

  const EditContactPopUp(
      {super.key, required this.client, required this.contact});
  @override
  createState() => _EditContactPopUp();
}

class _EditContactPopUp extends EditContactPopUpController {
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
