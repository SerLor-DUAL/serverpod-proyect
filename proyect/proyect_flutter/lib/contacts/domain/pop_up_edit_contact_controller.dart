part of '../presentation/pop_up_edit_contact.dart';

abstract class EditContactPopUpController extends State<EditContactPopUp> {
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

  Future<Map<String, String>?> checkIfContactIsOnList(
      String phoneNumber) async {
    bool isContactOnList =
        await widget.client.contact.isContactOnList(phoneNumber);
    Map<String, String>? error;

    if (isContactOnList) {
      error = {
        'errorTitle': 'Contact in list',
        'errorMessage': 'That contact is already in the list'
      };
    }
    return error;
  }

  // IF THERE'S NO ERROR IN THE TASK. CREATES THE TASK IN THE DB, ELSE POPUP ErrorAlertDialog
  Future<void> updateContact() async {
    Contact updatedContact = updateContactWithData();

    Map<String, String>? error =
        await checkIfContactIsOnList(updatedContact.phoneNumber);
    (error == null)
        ? await widget.client.contact.updateContact(updatedContact)
        : await showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomAlertDialog(
                customTitle: error["errorTitle"]!,
                customContent: error["errorMessage"]!,
              );
            });
  }
}
