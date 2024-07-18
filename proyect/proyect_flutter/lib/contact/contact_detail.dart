import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import 'package:proyect_flutter/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ContactDetails extends StatefulWidget {
  // NEEDS A TASK TO EDIT AND CLIENT TO WORK WITH DB
  final Contact contact;
  final Client client;

  const ContactDetails({super.key, required this.contact, required this.client});

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

// DELETE TASK
Future<void> deleteContact(Contact contact) async {
  await client.contact.deleteContact(contact);
}

class _ContactDetailsState extends State<ContactDetails> {
// ----------------------- BUILDER ------------------------------ //
  @override
  Widget build(BuildContext context) {
    // WE SET THE TASK WE WILL WORK ON.
    Contact contact = widget.contact;

    return Scaffold(
      // APPBAR
      appBar: AppBar(
        title: Text(contact.name, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[900],
      ),
      // BODY : CENTERED COLUMN
      body: Center(
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
                ]
                )
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
                ]
                )
            ),
            const SizedBox(height: 20.0),
            LayoutBuilder(
              builder: (context, constraints) {
                double maxWidth = constraints.maxWidth*0.3;

                return SizedBox(
                  width: maxWidth,
                  child: TextFormField(
                    minLines: 2,
                    maxLines: 12,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.message,
                        color: Color.fromARGB(255, 124, 214, 255)),
                      hintText: "Send a message!",
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color.fromARGB(255, 226, 223, 223)
                    ),
                    validator: (String? value) {
                      return (value == '')? 'Please, fill the text area' : null; 
                    },
                  ),
                );
              }
            ),
            const SizedBox(height: 20.0),
            TextButton.icon(onPressed: () {
              
            },
            icon: const Icon(
              Icons.send_sharp,
              color: Color.fromRGBO(236,229,221,1.000),
            ),
            label: const Text("Send Whatsapp"),
            style: TextButton.styleFrom(
              foregroundColor: Color.fromRGBO(236,229,221,1.000),
              backgroundColor: Color.fromRGBO(37,211,102,1.000)
            )
        )
          ],
        ),
      ),
      // floatingActionButton ROW WITH TWO BUTTONS.
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // EDIT TASK BUTTON
          FloatingActionButton(
            onPressed: () async {
              /*
              await showDialog(
                context: context,
                builder: (BuildContext context) =>
                    EditTaskPopUp(client: widget.client, task: widget.task),
              );
              // UPDATES STATE AFTER EditTaskPopUp
              setState(() {});
              */
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
    );
  }
}
