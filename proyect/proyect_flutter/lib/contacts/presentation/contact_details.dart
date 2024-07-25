import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import 'package:proyect_flutter/common/ui/custom_alert_dialog.dart';
import 'package:proyect_flutter/common/ui/custom_input_dialog.dart';
part '../domain/contact_details_controller.dart';

class ContactDetails extends StatefulWidget {
  // NEEDS A CONTACT TO EDIT AND CLIENT TO WORK WITH DB
  final Contact contact;
  final Client client;
  final UsersRegistry user;

  const ContactDetails(
      {super.key, required this.contact, required this.client, required this.user});

  @override
  createState() => _ContactDetails();
}

class _ContactDetails extends ContactDetailsController {

// ----------------------- BUILDER ------------------------------ //
   @override
  Widget build(BuildContext context) {

  Contact contact = widget.contact;

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
        // APPBAR
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Contact Details",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF369DD8),
          toolbarHeight: 78,
        ),
        // BODY : CENTERED COLUMN
        body: Column(
          children: [
            Container(
              height: 20.0,
              color: Colors.white,
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Name: ',
                        style: const TextStyle(
                          fontSize: 30.00,
                          color: Color.fromARGB(255, 124, 214, 255),
                          fontWeight: FontWeight.w800,
                        ),
                        children: [
                          TextSpan(
                            text: contact.name,
                            style: const TextStyle(
                              fontSize: 30.00,
                              color: Colors.black,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Phone: ',
                        style: const TextStyle(
                          fontSize: 30.00,
                          color: Color.fromARGB(255, 124, 214, 255),
                          fontWeight: FontWeight.w800,
                        ),
                        children: [
                          TextSpan(
                            text: contact.phoneNumber,
                            style: const TextStyle(
                              fontSize: 30.00,
                              color: Colors.black,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        double maxWidth = constraints.maxWidth * 0.3;
                        return SizedBox(
                          width: maxWidth,
                          child: TextFormField(
                            minLines: 2,
                            maxLines: 12,
                            decoration: InputDecoration(
                              icon: const Icon(Icons.message,
                                  color: Color.fromARGB(255, 124, 214, 255)),
                              hintText: "Send a message!",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 255, 250, 250),
                            ),
                            validator: (String? value) {
                              return (value == '') ? 'Please, fill the text area' : null;
                            },
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send_sharp,
                        color: Color.fromRGBO(236, 229, 221, 1.000),
                      ),
                      label: const Text("Send Whatsapp"),
                      style: TextButton.styleFrom(
                        foregroundColor: const Color.fromRGBO(236, 229, 221, 1.000),
                        backgroundColor: const Color.fromRGBO(37, 211, 102, 1.000),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        // FLOATING ACTION BUTTON ROW WITH TWO BUTTONS
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // EDIT TASK BUTTON
            FloatingActionButton(
              onPressed: () async {
                await _askForUpdateToDoInput();
                // UPDATES STATE AFTER EditTaskPopUp
                setState(() {});
              },
              backgroundColor: Colors.lightBlue[900],
              child: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 30),
            // DELETE TASK BUTTON
            FloatingActionButton(
              onPressed: () async {
                await deleteContact(contact);

                if (!context.mounted) return;
                Navigator.pop(context);
              },
              backgroundColor: Colors.lightBlue[900],
              child: const Icon(
                Icons.delete_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}