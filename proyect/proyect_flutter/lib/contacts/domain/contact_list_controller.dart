part of '../presentation/contact_list.dart';

abstract class ContactListController extends State<ContactList> {
  List<Contact> _contactList = [];

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  // LOAD EVERYTASK FROM USERID IN WIDGET.
  void _loadContacts() async {
    final List<Contact> contactList =
        await widget.client.contact.getEveryContactByUser(widget.user.id!);
    setState(() {
      _contactList = contactList;
    });
  }

    void _askForContactInput() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => CreateContactPopUp(
        client: widget.client,
        userID: widget.user.id!,
      ),
    );
    _loadContacts();
  }
}
