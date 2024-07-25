import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import 'package:proyect_flutter/common/ui/custom_alert_dialog.dart';
import 'package:proyect_flutter/common/ui/custom_input_dialog.dart';
import 'package:proyect_flutter/main.dart';
part '../domain/contact_list_controller.dart';

// ------------------------ Contact List ------------------------- \\
class ContactList extends StatefulWidget {
  final Client client;
  final UsersRegistry user;

  // FUNCIÓN DE CALLBACK PARA ACTUALIZAR EL ÍNDICE
  final void Function(int) updateHomeIndex;

  // FUNCIÓN DE CALLBACK PARA SELECCIONAR CONTACTO
  final void Function(Contact) selectContact;

  const ContactList(
      {super.key,
      required this.client,
      required this.user,
      required this.selectContact,
      required this.updateHomeIndex});

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
                padding: const EdgeInsets.all(50),
                itemCount: _contactList.length,
                itemBuilder: (BuildContext context, int index) {
                  Contact contact = _contactList[index];
  
                    return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              widget.selectContact(contact);
                              widget.updateHomeIndex(4);
                              _loadContacts();
                            },
                            child: HoverableContactName(contact: contact,),
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

// ------------------------ HoverableContactName ------------------------- \\

class HoverableContactName extends StatefulWidget {
  final Contact contact;

  const HoverableContactName({
    super.key,
    required this.contact,
  });

  @override
  _HoverableContactNameState createState() => _HoverableContactNameState();
}

class _HoverableContactNameState extends State<HoverableContactName> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Text(
        widget.contact.name,
        style: TextStyle(
          fontSize: 23.0,
          fontWeight: isHovered ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
