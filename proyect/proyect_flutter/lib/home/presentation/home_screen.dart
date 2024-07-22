import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyect_client/proyect_client.dart';
import '../domain/to_do_list/to_do_list.dart';
import '../domain/contact/contact_list.dart';

class HomeScreen extends StatefulWidget {
  final Client client;
  final UsersRegistry user;
  const HomeScreen({super.key, required this.client, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isHoveringOptions = false;
  bool _isHoveringLogOut = false;
  bool _isHoveringList = false;
  bool _isHoveringChat = false;
  bool _isHoveringToDo = false;
  bool _isHoveringContacts = false;

  int _currentIndex = 0;

  Widget _getCurrentPage() {
    switch (_currentIndex) {
      case 0:
        return const Center(
            child: Text('Options Screen', style: TextStyle(fontSize: 24)));
      case 1:
        return ContactList(client: widget.client, user: widget.user);
      case 2:
        return ToDoList(client: widget.client, user: widget.user);
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
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  border: Border(
                    right: BorderSide(
                      color: Color(0xFF369DD8),
                      width: 2,
                    ),
                  ),
                ),

                // LISTA DE MENUS
                child: ListView(
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  children: [
                    // MENU USARIO
                    _buildMenuContext(
                      icon: FontAwesomeIcons.solidCircleUser,
                      text: widget.user.userName,
                    ),

                    const SizedBox(height: 20),

                    // OPCIONES MENU USUARIO
                    _buildMenuItem(
                      isHovering: _isHoveringOptions,
                      icon: Icons.settings_sharp,
                      text: 'Options',
                      onTap: () {
                        setState(() {
                          _currentIndex = 0;
                        });
                      },
                      onEnter: (_) => setState(() => _isHoveringOptions = true),
                      onExit: (_) => setState(() => _isHoveringOptions = false),
                    ),

                    // TO DO LIST MENU USUARIO
                    _buildMenuItem(
                      isHovering: _isHoveringToDo,
                      icon: Icons.toc,
                      text: 'To Do List',
                      onTap: () {
                        setState(() {
                          _currentIndex = 2;
                        });
                      },
                      onEnter: (_) => setState(() => _isHoveringToDo = true),
                      onExit: (_) => setState(() => _isHoveringToDo = false),
                    ),

                    // LOG OUT MENU USUARIO
                    _buildMenuItem(
                      isHovering: _isHoveringLogOut,
                      icon: Icons.login_rounded,
                      text: 'Log Out',
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      onEnter: (_) => setState(() => _isHoveringLogOut = true),
                      onExit: (_) => setState(() => _isHoveringLogOut = false),
                    ),

                    const SizedBox(height: 30),

                    // MENU CONTACTOS
                    _buildMenuContext(
                      icon: Icons.people,
                      text: 'Contacts',
                    ),

                    const SizedBox(height: 20),

                    // LIST OF CONTACTS MENU CONTACTOS
                    _buildMenuItem(
                      isHovering: _isHoveringList,
                      icon: Icons.contact_page_rounded,
                      text: 'List',
                      onTap: () {
                        setState(() {
                          _currentIndex = 1;
                        });
                      },
                      onEnter: (_) => setState(() => _isHoveringList = true),
                      onExit: (_) => setState(() => _isHoveringList = false),
                    ),

                    const SizedBox(height: 10),

                    // CHAT MENU CONTACTOS
                    _buildMenuItem(
                      isHovering: _isHoveringChat,
                      icon: Icons.chat_bubble_rounded,
                      text: 'Chat',
                      onTap: () {
                        setState(() {
                          _currentIndex = 3;
                        });
                      },
                      onEnter: (_) => setState(() => _isHoveringChat = true),
                      onExit: (_) => setState(() => _isHoveringChat = false),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: _getCurrentPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuContext({
    required IconData icon,
    required String text,
  }) {
    return Container(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
      decoration: const BoxDecoration(
        color: Color(0xFF369DD8),
        borderRadius: BorderRadius.horizontal(left: Radius.circular(40)),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color.fromARGB(255, 255, 255, 255),
          size: 50,
        ),
        title: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Color.fromARGB(221, 255, 255, 255),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required bool isHovering,
    required IconData icon,
    required String text,
    required void Function() onTap,
    required void Function(PointerEnterEvent) onEnter,
    required void Function(PointerExitEvent) onExit,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: onEnter,
      onExit: onExit,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          padding: const EdgeInsets.only(left: 20.0),
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isHovering ? const Color(0xFF369DD8) : Colors.transparent,
              width: 1.5,
            ),
            color: isHovering
                ? const Color(0xFF369DD8).withOpacity(0.1)
                : Colors.transparent,
          ),
          child: ListTile(
            leading: Icon(
              icon,
              color: const Color(0xFF369DD8),
              size: 35,
            ),
            title: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
