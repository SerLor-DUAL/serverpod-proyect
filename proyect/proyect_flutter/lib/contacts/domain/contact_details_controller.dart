part of '../presentation/contact_details.dart';

abstract class ContactDetailsController extends State<ContactDetails> {
  // CONTROLLERS
  final TextEditingController _nameCon = TextEditingController();
  final TextEditingController _phoneCon = TextEditingController();

  // TAKES CONTROLLER'S DATA AND CREATE A TASK
  Contact updateContactWithData() {
    Contact updatedContact = widget.contact;
    updatedContact.name =
        (_nameCon.text == '') ? updatedContact.name : _nameCon.text;
    updatedContact.phoneNumber =
        (_phoneCon.text == '') ? updatedContact.phoneNumber : _phoneCon.text;
    return updatedContact;
  }

  Future<Map<String, String>?> checkIfContactIsOnList() async {
    bool isContactOnList =
        await widget.client.contact.isContactOnList(_phoneCon.text, widget.user.id!);
    Map<String, String>? error;

    if (isContactOnList) {
      error = {
        'errorTitle': 'Contact in list',
        'errorMessage': 'That contact is already in the list'
      };
    }
    return error;
  }

  // IF THERE'S NO ERROR IN THE CONTACT. UPDATES THE TASK IN THE DB, ELSE POPUP ErrorAlertDialog
  Future<void> updateContact() async {

    Map<String, String>? error =
        await checkIfContactIsOnList();
    if (error == null){
      Contact updatedContact = updateContactWithData();
      await widget.client.contact.updateContact(updatedContact);
      } 
      else {
        if (mounted)
          {
            await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomAlertDialog(
                    customTitle: error["errorTitle"]!,
                    customContent: error["errorMessage"]!,
                  );
                });
          }
          }
  }

  Future<void> deleteContact(Contact contact) async {
    await widget.client.contact.deleteContact(contact);
  }

  // CUSTOM INPUT DIALOG FOR UPDATE OF CONTACTS
  Future<void> _askForUpdateToDoInput() async {
    _nameCon.text = widget.contact.name;
    _phoneCon.text = widget.contact.phoneNumber;
    await showDialog(
      context: context,
      builder: (BuildContext context) => CustomInputDialog(
        client: widget.client,
        title: 'Edit Contact',
        content: null, // NO QUIERO CONTENIDO AQUÍ
        textControllers: [_nameCon, _phoneCon],
        labels: const ['Name', 'Phone'],
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              await updateContact();
              Navigator.of(context).pop();
            },
            child: const Text('Edit Contact'),
          ),
        ],
      ),
    );
  }

  // BUTTON CREATOR FOR LOG OUT
  void _askForDeleteConfirmation(Contact contact) async {
    await showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        customTitle: "Delete Contact?",
        customContent: "Are you sure you want to delete this contact?",
        customActions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              await deleteContact(contact);
              if (!context.mounted) return;
              widget.updateHomeIndex(1);
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
