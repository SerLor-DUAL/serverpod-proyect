import 'package:flutter/material.dart';
import 'package:proyect_client/proyect_client.dart';
import 'package:proyect_flutter/common/services/app_routes.dart';
import 'package:proyect_flutter/contacts/presentation/contact_details.dart';
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
  final UserInfo? userInfo;
  const Home({super.key, required this.client, required this.user, required this.userInfo});

  @override
  createState() => _Home();
}

class _Home extends HomeController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: LayoutBuilder(
          builder: (context, constraints) {
            // SCREEN SIZING
            double screenWidth = constraints.maxWidth;

            // UPDATES SCREEN SIZING AFTER BUILDING THE SCREEN
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (screenWidth != this.screenWidth) {
                _updateScreenWidth(screenWidth);
              }
            });

            // CHECK SIDEBAR STATUS BASED IN SCREEN SIZING AND SIDEBAR BUTTON
            bool isSidebarExpanded = screenWidth > _sidebarBreakpoint
                ? _isSidebarManuallyToggled || _isSidebarExpanded
                : _isSidebarExpanded;

            return Row(
              children: [
                // SIDEBAR
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: isSidebarExpanded ? 400 : 85,
                  child: Column(
                    children: [
                      _buildSidebarHeader(),
                      Expanded(
                        child: _buildSidebar(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: isSidebarExpanded ? 3 : 1,
                  child: _getCurrentPage(),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleSidebar,
        backgroundColor: Colors.blue,
        child: Icon(
          _isSidebarExpanded ? Icons.chevron_left : Icons.chevron_right,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }

  // SIDEBAR HEADER
  Widget _buildSidebarHeader() {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      firstChild: Container(
        color: Colors.white,
        height: 20,
        width: double.infinity,
      ),
      secondChild: Container(
        color: Colors.white,
        height: 20,
        width: double.infinity,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(),
        ),
      ),
      crossFadeState: _isSidebarExpanded
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
    );
  }

  // FULLY SIDEBAR BUILDER
  Widget _buildSidebar() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(
            color: Color(0xFF369DD8),
            width: 2,
          ),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.only(
          left: _isSidebarExpanded ? 20 : 0,
          bottom: 20,
        ),
        children: [

          // MENU USER
          buildSideBarItem(
            icon: null,                                             // NULL FOR ACTIVATED AVATAR IMAGE
            imageUrl: widget.userInfo?.imageUrl,                    // CONDITIONAL FOR IMAGE URL
            text: _isSidebarExpanded ? widget.user.userName : '',   // USER NAME IF SIDEBAR IS EXPANDED
            borderQuantity: _isSidebarExpanded ? 40 : 0,
          ),
          const SizedBox(height: 20),

          // OPTIONS MENU USER
          buildSideBarSubItem(
            hasText: _isSidebarExpanded,
            borderQuantity: _isSidebarExpanded ? 40 : 0,
            paddingSizingList: _isSidebarExpanded ? [20] : [0],
            isHovering: _isHoveringOptions,
            isSelected: currentIndex == 0,
            icon: Icons.settings_sharp,
            text: 'Options',
            onTap: () {
              setState(() {
                currentIndex = 0;
              });
            },
            onEnter: (_) => setState(() => _isHoveringOptions = true),
            onExit: (_) => setState(() => _isHoveringOptions = false),
          ),

          // TO DO LIST MENU USER
          buildSideBarSubItem(
            hasText: _isSidebarExpanded,
            borderQuantity: _isSidebarExpanded ? 40 : 0,
            paddingSizingList: _isSidebarExpanded ? [20] : [0],
            isHovering: _isHoveringToDo,
            isSelected: currentIndex == 2,
            icon: Icons.toc,
            text: 'To Do List',
            onTap: () {
              setState(() {
                currentIndex = 2;
              });
            },
            onEnter: (_) => setState(() => _isHoveringToDo = true),
            onExit: (_) => setState(() => _isHoveringToDo = false),
          ),

          // LOG OUT MENU USER
          buildSideBarSubItem(
            hasText: _isSidebarExpanded,
            borderQuantity: _isSidebarExpanded ? 40 : 0,
            paddingSizingList: _isSidebarExpanded ? [20] : [0],
            isHovering: _isHoveringLogOut,
            isSelected: currentIndex == 4,
            icon: Icons.login_rounded,
            text: 'Log Out',
            onTap: () {
              _askForExitConfirmation();
            },
            onEnter: (_) => setState(() => _isHoveringLogOut = true),
            onExit: (_) => setState(() => _isHoveringLogOut = false),
          ),

          const SizedBox(height: 30),

          // MENU CONTACTS
          buildSideBarItem(
            icon: Icons.people,
            imageUrl: null, // NULL FOR DEACTIVATED AVATAR IMAGE
            text: _isSidebarExpanded ? 'Contacts' : '',
            borderQuantity: _isSidebarExpanded ? 40 : 0,
          ),

          const SizedBox(height: 20),

          // LIST OF CONTACTS MENU CONTACTS
          buildSideBarSubItem(
            hasText: _isSidebarExpanded,
            borderQuantity: _isSidebarExpanded ? 40 : 0,
            paddingSizingList: _isSidebarExpanded ? [20] : [0],
            isHovering: _isHoveringList,
            isSelected: currentIndex == 1,
            icon: Icons.contact_page_rounded,
            text: 'List',
            onTap: () {
              setState(() {
                currentIndex = 1;
              });
            },
            onEnter: (_) => setState(() => _isHoveringList = true),
            onExit: (_) => setState(() => _isHoveringList = false),
          ),

          const SizedBox(height: 10),

          // CHAT MENU CONTACTS
          buildSideBarSubItem(
            hasText: _isSidebarExpanded,
            borderQuantity: _isSidebarExpanded ? 40 : 0,
            paddingSizingList: _isSidebarExpanded ? [20] : [0],
            isHovering: _isHoveringChat,
            isSelected: currentIndex == 3,
            icon: Icons.chat_bubble_rounded,
            text: 'Chat',
            onTap: () {
              setState(() {
                currentIndex = 3;
              });
            },
            onEnter: (_) => setState(() => _isHoveringChat = true),
            onExit: (_) => setState(() => _isHoveringChat = false),
          ),
        ],
      ),
    );
  }
}
