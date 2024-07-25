import 'package:flutter/material.dart';
import 'package:proyect_flutter/common/ui/custom_alert_dialog.dart';
import 'package:proyect_flutter/common/ui/custom_input_dialog.dart';
import 'package:proyect_client/proyect_client.dart';
part '../domain/contact_details_controller.dart';

class ContactDetails extends StatefulWidget {
  final Contact contact;
  final Client client;

  // FUNCIÓN DE CALLBACK PARA ACTUALIZAR EL ÍNDICE
  final void Function(int) updateHomeIndex;

  const ContactDetails(
      {super.key,
      required this.contact,
      required this.client,
      required this.updateHomeIndex});

  @override
  createState() => _ContactDetails();
}

class _ContactDetails extends ContactDetailsController with TickerProviderStateMixin {
    
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging && _tabController.index == 1) {
      widget.updateHomeIndex(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    Contact contact = widget.contact;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          height: 20,
          color: Colors.white,
        ),
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            "Contact Details",
            style: TextStyle(color: Colors.white),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF369DD8),
        toolbarHeight: 98,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(76),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.transparent,
                  width: 2.0,
                ),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: const Color(0xFF369DD8),
              indicatorColor: const Color(0xFF369DD8),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 2,
              tabs: const [
                Tab(
                  icon: Icon(
                    Icons.message,
                    color: Color(0xFF369DD8),
                  ),
                  text: "Messaging",
                ),
                Tab(
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Color(0xFF369DD8),
                  ),
                  text: "Return",
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildDetailsTab(contact),
        ],
      ),
    );
  }

  Widget _buildDetailsTab(Contact contact) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // PROFILE IMAGE
              const CircleAvatar(
                // backgroundImage: NetworkImage(contact.photoUrl),
                radius: 40,
              ),
              const SizedBox(width: 20.0),
              
              // CONTACT INFORMATION AND BUTTONS
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contact.name,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      contact.phoneNumber,
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    // BUTTONS FOR EDITING AND DELETING
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () async {
                            await _askForUpdateToDoInput();
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue[900],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 5,
                          ),
                          icon: const Icon(Icons.edit),
                          label: const Text('Edit'),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton.icon(
                          onPressed: () async {
                            await deleteContact(contact);
                            if (!context.mounted) return;
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 5,
                          ),
                          icon: const Icon(Icons.delete_outline),
                          label: const Text('Delete'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          // Message section
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 250, 250),
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8.0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: TextFormField(
                      minLines: 2,
                      maxLines: 10,
                      decoration: const InputDecoration(
                        hintText: "Send a message!",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16.0),
                      ),
                      validator: (String? value) {
                        return (value == '')
                            ? 'Please, fill the text area'
                            : null;
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20.0),
                      padding: const EdgeInsets.all(15.0),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      foregroundColor: const Color(0xFF369DD8),
                      shadowColor: const Color.fromARGB(255, 54, 157, 216),
                      elevation: 5,
                      shape: ContinuousRectangleBorder(
                        side: const BorderSide(
                          color: Color.fromARGB(255, 54, 157, 216),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(
                      Icons.send_sharp,
                      color: Color(0xFF369DD8),
                    ),
                    label: const Text(
                      "Send Whatsapp",
                      style: TextStyle(
                        color: Color(0xFF369DD8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}