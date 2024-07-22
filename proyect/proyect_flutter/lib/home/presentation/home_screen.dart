import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyect_client/proyect_client.dart';
import '/home/domain/to_do_list/to_do_list.dart';

class HomeScreen extends StatefulWidget {
  final Client client;
  final int userId;
  const HomeScreen({super.key, required this.client, required this.userId });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // CONTROLADORES PARA MANTENER EL ESTADO DEL HOVER
  bool _isHoveringOptions = false;
  bool _isHoveringLogOut = false;
  bool _isHoveringList = false;
  bool _isHoveringChat = false;
  bool _isHoveringToDo = false;

  // VARIABLE PARA CONTROLAR LA PANTALLA ACTIVA
  int _currentIndex = 0;

  // Método para construir la página actual
  Widget _getCurrentPage() {
    switch (_currentIndex) {
      case 0:
        return const Center(
            child: Text('Options Screen', style: TextStyle(fontSize: 24)));
      case 1:
        return const Center(
            child:
                Text('Contacts List Screen', style: TextStyle(fontSize: 24)));
      case 2:
        return const Center(
            child: Text('Chat Screen', style: TextStyle(fontSize: 24)));
      case 3:
        return ToDoList(client: widget.client, userId: widget.userId);
      default:
        return const Center(
            child: Text('Unknown Screen', style: TextStyle(fontSize: 24)));
    }
  }

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
                      onEnter: (_) => setState(() => _isHoveringOptions = true),
                      onExit: (_) => setState(() => _isHoveringOptions = false),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndex =
                                0; // Cambia al índice de la pantalla "Options"
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: _isHoveringOptions
                                  ? const Color(0xFF369DD8)
                                  : Colors.transparent,
                              width: 1.5,
                            ),
                            color: _isHoveringOptions
                                ? const Color(0xFF369DD8).withOpacity(0.05)
                                : Colors.transparent,
                          ),
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
                    ),

                    const SizedBox(height: 15),

                    // USER LOG OUT BOX
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) => setState(() => _isHoveringLogOut = true),
                      onExit: (_) => setState(() => _isHoveringLogOut = false),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: _isHoveringLogOut
                                  ? const Color(0xFF369DD8)
                                  : Colors.transparent,
                              width: 1.5,
                            ),
                            color: _isHoveringLogOut
                                ? const Color(0xFF369DD8).withOpacity(0.05)
                                : Colors.transparent,
                          ),
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
                      onEnter: (_) => setState(() => _isHoveringList = true),
                      onExit: (_) => setState(() => _isHoveringList = false),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndex =
                                1; // Cambia al índice de la pantalla "Contacts List"
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: _isHoveringList
                                  ? const Color(0xFF369DD8)
                                  : Colors.transparent,
                              width: 1.5,
                            ),
                            color: _isHoveringList
                                ? const Color(0xFF369DD8).withOpacity(0.05)
                                : Colors.transparent,
                          ),
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
                    ),

                    const SizedBox(height: 15),

                    // CONTACTS CHAT BOX
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) => setState(() => _isHoveringChat = true),
                      onExit: (_) => setState(() => _isHoveringChat = false),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndex =
                                2; // Cambia al índice de la pantalla "Chat"
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: _isHoveringChat
                                  ? const Color(0xFF369DD8)
                                  : Colors.transparent,
                              width: 1.5,
                            ),
                            color: _isHoveringChat
                                ? const Color(0xFF369DD8).withOpacity(0.05)
                                : Colors.transparent,
                          ),
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
                    ),

                    const SizedBox(height: 15),

                    // TO DO LIST BOX
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) => setState(() => _isHoveringToDo = true),
                      onExit: (_) => setState(() => _isHoveringToDo = false),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndex =
                                3; // Cambia al índice de la pantalla "To Do List"
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: _isHoveringToDo
                                  ? const Color(0xFF369DD8)
                                  : Colors.transparent,
                              width: 1.5,
                            ),
                            color: _isHoveringToDo
                                ? const Color(0xFF369DD8).withOpacity(0.05)
                                : Colors.transparent,
                          ),
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
                child: _getCurrentPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
