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

class _ContactList extends ContactListController with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _addContact() async {
    await _askForContactInput();
  }

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
        appBar: AppBar(
          flexibleSpace: Container(
            height: 20,
            color: Colors.white,
          ),
          automaticallyImplyLeading: false,
          title: const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              "Contact List",
              style: TextStyle(color: Colors.white),
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF369DD8),
          toolbarHeight: 106,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(76),
            child: Stack(
              children: [
                MouseRegion(
                  onEnter: (_) {
                    setState(() {});
                  },
                  onExit: (_) {
                    setState(() {});
                  },
                  child: Container(
                    color: Colors.white,
                    child: TabBar(
                      controller: _tabController,
                      labelColor: const Color(0xFF369DD8),
                      indicatorColor: const Color(0xFF369DD8),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 2,
                      tabs: const [
                        Tab(
                          icon: Icon(
                            Icons.add,
                            color: Color(0xFF369DD8),
                          ),
                          text: "Add Contact",
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: GestureDetector(
                    onTap: _addContact,
                    // ASEGURA QUE SE CAPTURE CUALQUIER CLIC
                    behavior: HitTestBehavior.translucent,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 50, horizontal: 500),
              child: ListView.builder(
                itemCount: _contactList.length,
                itemBuilder: (BuildContext context, int index) {
                  Contact contact = _contactList[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ExpandableContactItem(
                      contact: contact,
                      selectContact: widget.selectContact,
                      updateHomeIndex: widget.updateHomeIndex,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandableContactItem extends StatefulWidget {
  final Contact contact;
  final void Function(Contact) selectContact;
  final void Function(int) updateHomeIndex;

  const ExpandableContactItem({
    super.key,
    required this.contact,
    required this.selectContact,
    required this.updateHomeIndex,
  });

  @override
  createState() => _ExpandableContactItemState();
}

class _ExpandableContactItemState extends State<ExpandableContactItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.selectContact(widget.contact);
        widget.updateHomeIndex(4);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
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
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(vertical: isHovered ? 30.0 : 15.0),
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF369DD8)),
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(120, 54, 157, 216),
                blurRadius: 3.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                mouseCursor: SystemMouseCursors.click,
                leading: CircleAvatar(
                  backgroundImage: (widget.contact.profileIMG != null)? AssetImage(widget.contact.profileIMG!): null,
                  backgroundColor: (widget.contact.profileIMG != null)? Colors.transparent : const Color(0xFF369DD8),
                  radius: 35,
                  child: (widget.contact.profileIMG == null)?
                                Text(  
                                  widget.contact.name[0].toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white, 
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.00)
                                ) :
                                null,
                ),
                title: Text(
                  widget.contact.name,
                  style: TextStyle(
                    fontSize: 23.0,
                    color: const Color(0xFF369DD8),
                    fontWeight: isHovered ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                subtitle: isHovered
                    ? Text(
                        'Phone Number: ${widget.contact.phoneNumber}',
                      )
                    : null,
                trailing: const Icon(
                  Icons.textsms,
                  color: Color(0xFF369DD8),
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
