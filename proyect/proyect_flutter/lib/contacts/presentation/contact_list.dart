import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import 'package:proyect_flutter/common/ui/custom_alert_dialog.dart';
import 'package:proyect_flutter/common/ui/custom_input_dialog.dart';
import 'package:proyect_flutter/main.dart';
part '../domain/contact_list_controller.dart';

class ContactList extends StatefulWidget {
  final Client client;
  final UsersRegistry user;
  final void Function(int) updateHomeIndex;  // Función de callback para actualizar el índice
  final void Function(Contact) selectContact; // Función de callback para seleccionar contacto
  const ContactList({super.key, required this.client, required this.user, required this.selectContact, required this.updateHomeIndex});

  @override
  createState() => _ContactList();
}

class _ContactList extends ContactListController {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(3, 0),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
      ),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 20.0,
              color: Colors.white,
            ),
            AppBar(
              automaticallyImplyLeading: false,
              title: const Text(
                "Contact List",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              backgroundColor: const Color(0xFF369DD8),
              toolbarHeight: 78,
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: _contactList.length,
                itemBuilder: (BuildContext context, int index) {
                  Contact contact = _contactList[index];
                  return ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            contact.name,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            widget.selectContact(contact);
                            widget.updateHomeIndex(4);
                            _loadContacts();
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromARGB(255, 1, 3, 3),
                          ),
                          tooltip: 'See details',
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await _askForContactInput();
          },
          backgroundColor: Colors.lightBlue[900],
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}