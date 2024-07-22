import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyect_client/proyect_client.dart';

class HomeScreen extends StatefulWidget {
  final Client client;
  const HomeScreen({super.key, required this.client});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: const Color.fromARGB(255, 255, 255, 255),

                child: ListView(
                  padding: const EdgeInsets.all(25),
                  children: [

                    // USER BOX
                    const ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.solidCircleUser,
                        color: Color(0xFF369DD8),
                        size: 50,
                      ),
                      title: Text("User"),
                    ),

                    const SizedBox(height: 15),

                    const Divider(
                      thickness: 2,
                      color: Color(0xFF369DD8),
                    ),

                    const SizedBox(height: 15),

                    // USER OPTIONS BOX
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const ListTile(
                          mouseCursor: MouseCursor.defer,
                          leading: Icon(
                            Icons.settings_sharp,
                            color: Color(0xFF369DD8),
                            size: 35,
                          ),
                          title: Text('Options'),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // USER LOG OUT BOX
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const ListTile(
                          mouseCursor: MouseCursor.defer,
                          leading: Icon(
                            Icons.login_rounded,
                            color: Color(0xFF369DD8),
                            size: 35,
                          ),
                          title: Text('Log Out'),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // CONTACTS BOX
                    const ListTile(
                      leading: Icon(
                        Icons.people,
                        color: Color(0xFF369DD8),
                        size: 50,
                      ),
                      title: Text('Contacts'),
                    ),
                    
                    const SizedBox(height: 15),

                    const Divider(
                      thickness: 2,
                      color: Color(0xFF369DD8),
                    ),

                    const SizedBox(height: 15),

                    // CONTACTS LIST BOX
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                            Navigator.of(context).pop();
                        },
                        child: const ListTile(
                          mouseCursor: MouseCursor.defer,
                          leading: Icon(
                            Icons.contact_page_rounded,
                            color: Color(0xFF369DD8),
                            size: 35,
                          ),
                          title: Text('List'),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // CONTACTS CHAT BOX
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const ListTile(
                          mouseCursor: MouseCursor.defer,
                          leading: Icon(
                            Icons.chat_bubble_rounded,
                            color: Color(0xFF369DD8),
                            size: 35,
                          ),
                          title: Text('Chat'),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // TO DO LIST BOX
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const ListTile(
                          mouseCursor: MouseCursor.defer,
                          leading: Icon(
                            Icons.toc,
                            color: Color(0xFF369DD8),
                            size: 50,
                          ),
                          title: Text('To Do List'),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Divider(
                      thickness: 2,
                      color: Color(0xFF369DD8),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
