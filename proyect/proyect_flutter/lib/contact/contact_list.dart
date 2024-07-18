import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import 'package:proyect_flutter/contact/contact_detail.dart';
import 'popups/create_contact_pop_up.dart';

class ContactList extends StatefulWidget {
  final Client client;
  final int userId;
  const ContactList({super.key, required this.client, required this.userId});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<Contact> _contactList = [];


  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  // Load everytask from userId in widget.
  void _loadContacts() async {
    final List<Contact> contactList =
        await widget.client.contact.getEveryContactByUser(widget.userId);
    setState(() {
      _contactList = contactList;
    });
  }

// ----------------------- BUILDER ------------------------------ //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APPBAR
      appBar: AppBar(
        title: const Text("IntegraQS ToDoList",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[900],
      ),

      //BODY : LISTVIEW
      body: ListView.builder(
        // STYLE AND LISTVIEW SETUP.
        padding: const EdgeInsets.all(8),
        itemCount: _contactList.length,
        itemBuilder: (BuildContext context, int index) {
          Contact contact = _contactList[index];

          // FOR EACH ITEM - ListTile
          return ListTile(
            // TITLE: ROW
            title: Row(
              children: [
                // LEFT SIDE : TITLE WITH NAME
                Expanded(
                  child: Text(
                    contact.name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // RIGHT SIDE : ICON
                IconButton(
                  onPressed: () async {
                    // Push ContactDetails
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactDetails(
                                  contact: contact,
                                  client: widget.client,
                                )));
                    // AFTER EDIT, LOAD EVERY TASK AGAIN.
                    _loadContacts();
                  },
                  icon: const Icon((Icons.arrow_forward_ios),
                      color: Color.fromARGB(255, 1, 3, 3)),
                  tooltip: 'See details',
                ),
              ],
            ),
          );
        },
      ),

      // FLOATING ACTION
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // TODO: ADAPT THAT

          await showDialog(
            context: context,
            builder: (BuildContext context) => CreateContactPopUp(
              client: widget.client,
              userID: widget.userId,
            ),
          );
          _loadContacts();
        },
        backgroundColor: Colors.lightBlue[900],
        // ICON AS CHILD
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}