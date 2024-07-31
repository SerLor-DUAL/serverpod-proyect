import 'package:flutter/material.dart';
import 'package:proyect_client/proyect_client.dart';
import 'package:proyect_flutter/common/ui/custom_alert_dialog.dart';
import 'package:proyect_flutter/common/ui/profile_selection_dialog.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
part '../domain/user_config_controller.dart';

class UserProfileConfig extends StatefulWidget {

  final Client client;
  final UsersRegistry user;
  final UserInfo userInfo;

  const UserProfileConfig({
    super.key,
    required this.client,
    required this.user,
    required this.userInfo,
  });

  @override
  createState() => _UserProfileConfig();
}

class _UserProfileConfig extends UserProfileConfigController
    with TickerProviderStateMixin {
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

  void _updateUser() async {
    await updateUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
              "User Profile",
              style: TextStyle(color: Colors.white),
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF369DD8),
          toolbarHeight: 98,
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
                    decoration: const BoxDecoration(
                      color: Colors.white,
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
                          text: "Save Data",
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: GestureDetector(
                    onTap: _updateUser,
                    // ENSURES ANY CLICK IS CAPTURED
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
            Center(
              child: AnimatedContainer(
                alignment: Alignment.center,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: screenWidth > 600 ? 1200 : screenWidth * 0.9,
                padding: const EdgeInsets.only(
                    top: 75.0, bottom: 275.0, left: 100.0, right: 100.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: const Color(0xFF369DD8),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 4,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 90.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // IMAGE AND SELECTOR TO THE LEFT
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 20),
                                CircleAvatar(
                                  radius: screenWidth > 600 ? 75 : 50,
                                  backgroundImage: (widget.userInfo.imageUrl != null)
                                      ? AssetImage(widget.userInfo.imageUrl!)
                                      : null,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        right: 0,
                                        bottom: 0,
                                        child: CircleAvatar(
                                          radius: screenWidth > 600 ? 20 : 15,
                                          backgroundColor: Colors.blue,
                                          child: IconButton(
                                            onPressed: () async {
                                              await updateUserPicture();
                                              setState(() {});
                                            },
                                            icon: Icon(
                                              Icons.camera_alt,
                                              size: screenWidth > 600 ? 20 : 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 50),
                          // INPUT FIELDS TO THE RIGHT
                          Flexible(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  controller: _userNameController,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 54, 157, 216),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: const InputDecoration(
                                    labelText: 'Username',
                                    labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 54, 157, 216),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 54, 157, 216),
                                        width: 1.5,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 54, 157, 216),
                                        width: 1.5,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                TextField(
                                  controller: _fullNameController,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 54, 157, 216),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: const InputDecoration(
                                    labelText: 'Full Name',
                                    labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 54, 157, 216),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 54, 157, 216),
                                        width: 1.5,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 54, 157, 216),
                                        width: 1.5,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                TextField(
                                  controller: _emailController,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 54, 157, 216),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: const InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 54, 157, 216),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 54, 157, 216),
                                        width: 1.5,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 54, 157, 216),
                                        width: 1.5,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
