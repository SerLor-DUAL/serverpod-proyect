part of '../presentation/contact_list.dart';

abstract class ContactListController extends State<ContactList> {

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  List<Contact> _contactList = [];

  // CONTROLLERS
  final TextEditingController _nameCon = TextEditingController();
  final TextEditingController _phoneCon = TextEditingController();

  void emptyControllers() {
    _nameCon.text = '';
    _phoneCon.text = '';
  }
  // CHECKS IF ERROR EXISTS
  Future<Map<String, String>?> checkIfError() async {
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
    if (!isPhoneMatch(_phoneCon.text)){
      errorTitle = "Phone doesn't match";
      errorMessage += 'Phone must have 9 nums';
    }
    else {
      // IF PHONE IS NOT A MATCH WHY CHECK IF IT IS ON THE LIST? NONSENSE.
      bool isContactOnList = await client.contact.isContactOnList(_phoneCon.text, widget.user.id!);
      if (isContactOnList) {
        errorTitle = 'Contact already in your list';
        errorMessage = 'That contact is already in your list';
      }
    }

    if (errorTitle == '' && errorMessage == '') {
      return null;
    }
    return {
      "errorTitle": "Error with: $errorTitle",
      "errorMessage": errorMessage
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
            return CustomAlertDialog(
              customTitle: error["errorTitle"]!,
              customContent: error["errorMessage"]!,
            );
          });
      return;
    }
    Contact newContact = createContactWithData();

    await widget.client.contact.addContact(newContact);
  }

  // TAKES CONTROLLER'S DATA AND CREATE A TASK
  Contact createContactWithData() {
    return Contact(
        name: _nameCon.text,
        phoneNumber: _phoneCon.text,
        profileIMG: null,
        userID: widget.user.id!);
  }

  // LOAD EVERYTASK FROM USERID IN WIDGET.
  Future<void> _loadContacts() async {
    final List<Contact> contactList =
        await widget.client.contact.getEveryContactByUser(widget.user.id!);
    setState(() {
      _contactList = contactList;
    });
  }

  Future<void> _askForContactInput() async {
    _nameCon.text = '';
    _phoneCon.text = '';
    await showDialog(
      context: context,
      builder: (BuildContext context) => CustomInputDialog(
        client: widget.client,
        user: widget.user,
        title: 'Add Contact',
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
              await createContact();
              Navigator.of(context).pop();
            },
            child: const Text('Create Contact'),
          ),
        ],
      ),
    );
    await _loadContacts();
    emptyControllers();
  }
  // ------------------------ Format Methods ------------------------- \\
  // RETURNS TRUE IF THE PHONE IS A MATCH
  bool isPhoneMatch(String phoneNumber) {
    RegExp exp = RegExp(r'^[0-9]{9}$');
    return exp.hasMatch(phoneNumber);
  }
}
