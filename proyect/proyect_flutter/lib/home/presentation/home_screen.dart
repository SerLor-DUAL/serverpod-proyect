import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  final Client client;
  const HomeScreen({super.key, required this.client });

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
                color: const Color.fromARGB(255, 54, 157, 216),
                child: ListView(
                  padding: const EdgeInsets.all(25),
                  children: const [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.solidCircleUser,
                              color: Color(0xFF369DD8),
                              size: 50,
                            ),
                            title: Text('User'),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: Color(0xFF369DD8),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(40, 5, 0, 0),
                            child: ListTile(
                              leading: Icon(
                                Icons.settings_sharp,
                                color: Color(0xFF369DD8),
                                size: 35,
                              ),
                              title: Text('Options'),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(40, 5, 0, 0),
                            child: ListTile(
                              leading: Icon(
                                Icons.login_rounded,
                                color: Color(0xFF369DD8),
                                size: 35,
                              ),
                              title: Text('Log Out'),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: ListTile(
                            leading: Icon(
                              Icons.people,
                              color: Color(0xFF369DD8),
                              size: 50,
                            ),
                            title: Text('Contacts'),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: Color(0xFF369DD8),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(40, 5, 0, 0),
                            child: ListTile(
                              leading: Icon(
                                Icons.contact_page_rounded,
                                color: Color(0xFF369DD8),
                                size: 35,
                              ),
                              title: Text('List'),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(40, 5, 0, 0),
                            child: ListTile(
                              leading: Icon(
                                Icons.chat_bubble_rounded,
                                color: Color(0xFF369DD8),
                                size: 35,
                              ),
                              title: Text('Chat'),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: ListTile(
                            leading: Icon(
                              Icons.toc,
                              color: Color(0xFF369DD8),
                              size: 50,
                            ),
                            title: Text('To Do List'),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: Color(0xFF369DD8),
                        ),
                      ],
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
