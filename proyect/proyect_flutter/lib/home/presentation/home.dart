import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyect_client/proyect_client.dart';
import 'package:proyect_flutter/common/services/app_routes.dart';
import 'package:proyect_flutter/contacts/presentation/contact_details.dart';
import 'package:proyect_flutter/main.dart';
import 'package:proyect_flutter/to_do_list/presentation/to_do_list.dart';
import 'package:proyect_flutter/user_config/presentation/user_config.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import '../../contacts/presentation/contact_list.dart';
import '../../common/ui/custom_alert_dialog.dart';
import './widget_sidebar_item.dart';
import './widget_sidebar_sub_item.dart';
part '../domain/home_controller.dart';

class Home extends StatefulWidget {
  final Client client;
  final UsersRegistry user;
  const Home({super.key, required this.client, required this.user});

  @override
  createState() => _Home();

  
}

class _Home extends HomeController {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (!sessionManager.isSignedIn) {
      return const Text("401 - NOT AUTHORIZED");
    }
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Row(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: 400,
                      height: 20,
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    width: 400,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        right: BorderSide(
                          color: Color(0xFF369DD8),
                          width: 2,
                        ),
                      ),
                    ),
                    // LISTA DE MENUS
                    child: ListView(
                      padding: const EdgeInsets.only(left: 20, bottom: 20),
                      children: [
                        // MENU USARIO
                        buildSideBarItem(
                          icon: FontAwesomeIcons.solidCircleUser,
                          text: widget.user.userName,
                        ),

                        const SizedBox(height: 20),

                        // OPCIONES MENU USUARIO
                        buildSideBarSubItem(
                          isHovering: _isHoveringOptions,
                          isSelected: currentIndex == 0,
                          icon: Icons.settings_sharp,
                          text: 'Options',
                          onTap: () {
                            setState(() {
                              currentIndex = 0;
                            });
                          },
                          onEnter: (_) =>
                              setState(() => _isHoveringOptions = true),
                          onExit: (_) =>
                              setState(() => _isHoveringOptions = false),
                        ),

                        // TO DO LIST MENU USUARIO
                        buildSideBarSubItem(
                          isHovering: _isHoveringToDo,
                          isSelected: currentIndex == 2,
                          icon: Icons.toc,
                          text: 'To Do List',
                          onTap: () {
                            setState(() {
                              currentIndex = 2;
                            });
                          },
                          onEnter: (_) =>
                              setState(() => _isHoveringToDo = true),
                          onExit: (_) =>
                              setState(() => _isHoveringToDo = false),
                        ),

                        // LOG OUT MENU USUARIO
                        buildSideBarSubItem(
                          isHovering: _isHoveringLogOut,
                          isSelected: currentIndex == 4,
                          icon: Icons.login_rounded,
                          text: 'Log Out',
                          onTap: () {
                            _askForExitConfirmation();
                          },
                          onEnter: (_) =>
                              setState(() => _isHoveringLogOut = true),
                          onExit: (_) =>
                              setState(() => _isHoveringLogOut = false),
                        ),

                        const SizedBox(height: 30),

                        // MENU CONTACTOS
                        buildSideBarItem(
                          icon: Icons.people,
                          text: 'Contacts',
                        ),

                        const SizedBox(height: 20),

                        // LIST OF CONTACTS MENU CONTACTOS
                        buildSideBarSubItem(
                          isHovering: _isHoveringList,
                          isSelected: currentIndex == 1,
                          icon: Icons.contact_page_rounded,
                          text: 'List',
                          onTap: () {
                            setState(() {
                              currentIndex = 1;
                            });
                          },
                          onEnter: (_) =>
                              setState(() => _isHoveringList = true),
                          onExit: (_) =>
                              setState(() => _isHoveringList = false),
                        ),

                        const SizedBox(height: 10),

                        // CHAT MENU CONTACTOS
                        buildSideBarSubItem(
                          isHovering: _isHoveringChat,
                          isSelected: currentIndex == 3, 
                          icon: Icons.chat_bubble_rounded,
                          text: 'Chat',
                          onTap: () {
                            setState(() {
                              currentIndex = 3;
                            });
                          },
                          onEnter: (_) =>
                              setState(() => _isHoveringChat = true),
                          onExit: (_) =>
                              setState(() => _isHoveringChat = false),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
}