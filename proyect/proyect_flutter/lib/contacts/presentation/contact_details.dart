import 'package:flutter/material.dart';
import 'package:proyect_client/proyect_client.dart';
import 'package:proyect_flutter/common/services/afilnet_service.dart';
import 'package:proyect_flutter/common/ui/custom_alert_dialog.dart';
import 'package:proyect_flutter/common/ui/custom_input_dialog.dart';
import 'package:proyect_flutter/common/ui/profile_selection_dialog.dart';
import 'package:proyect_shared_santiago/proyect_shared_santiago.dart';
import 'package:proyect_client/proyect_client.dart';
part '../domain/contact_details_controller.dart';

class ContactDetails extends StatefulWidget {
  final Contact contact;
  final Client client;
  final UsersRegistry user;
  final void Function(int) updateHomeIndex;

  const ContactDetails({
    super.key,
    required this.contact,
    required this.client,
    required this.user,
    required this.updateHomeIndex,
  });

  @override
 createState() => _ContactDetails();
}

class _ContactDetails extends ContactDetailsController {

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
    _afilnetService = AfilnetService(widget.client);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    _messageController.dispose();
    super.dispose();
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
          Container(),
        ],
      ),
    );
  }

  Widget _buildDetailsTab(Contact contact) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 150.0, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // UI elements
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  CircleAvatar(
                    backgroundImage: (contact.profileIMG != null) ? AssetImage(contact.profileIMG!) : null,
                    backgroundColor: (contact.profileIMG != null) ? Colors.transparent : const Color(0xFF369DD8),
                    radius: 40,
                    child: (contact.profileIMG == null)
                        ? Text(
                            widget.contact.name[0].toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.00),
                          )
                        : null,
                  ),
                  Positioned(
                    right: 2,
                    bottom: 2,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.blue,
                      child: IconButton(
                        icon: const Icon(Icons.edit, color: Colors.white, size: 16),
                        onPressed: () async {
                          await _updateContactPicture();
                          setState(() {});
                        },
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20.0),
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
                  ],
                ),
              ),
              const SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await _askForUpdateToDoInput();
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(130, 40),
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
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.edit, color: Color(0xFF369DD8)),
                        SizedBox(width: 8.0),
                        Text('Edit'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () async {
                      _askForDeleteConfirmation(contact);
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(130, 40),
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
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.delete_outline, color: Color(0xFF369DD8)),
                        SizedBox(width: 8.0),
                        Text('Delete'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 50.0),
          Container(
            height: 420,
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 250, 250),
              border: Border(
                top: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
                left: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
                right: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
                bottom: BorderSide.none,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
                bottomLeft: Radius.zero,
                bottomRight: Radius.zero,
              ),
              boxShadow: [
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
                    controller: _messageController,
                    style: const TextStyle(color: Color(0xFF369DD8)),
                    minLines: 2,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      hintText: "Write a message!",
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
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _sendSms,
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20.0),
                    padding: const EdgeInsets.all(30.0),
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}