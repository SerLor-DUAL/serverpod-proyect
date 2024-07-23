part of '../presentation/contact_list.dart';

abstract class ContactListController extends State<ContactList> {
  List<Contact> _contactList = [];

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  // Load everytask from userId in widget.
  void _loadContacts() async {
    final List<Contact> contactList =
        await widget.client.contact.getEveryContactByUser(widget.user.id!);
    setState(() {
      _contactList = contactList;
    });
  }
}
