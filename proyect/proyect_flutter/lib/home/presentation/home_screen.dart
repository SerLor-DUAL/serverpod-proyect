import 'package:proyect_client/proyect_client.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_page_model.dart';
export 'home_page_model.dart';

class HomeScreen extends StatefulWidget {

  final Client client;
  const HomeScreen({super.key, required this.client});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  late HomeScreen _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: 1454,
            height: 954,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 100,
                    height: 929,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(25),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: ListTile(
                                      leading: FaIcon(
                                        FontAwesomeIcons.solidUserCircle,
                                        color: Color(0xFF369DD8),
                                        size: 50,
                                      ),
                                      title: Text(
                                        'User',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Outfit',
                                              letterSpacing: 0,
                                            ),
                                      ),
                                      dense: false,
                                      contentPadding: EdgeInsets.all(12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: Color(0xFF369DD8),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 5, 0, 0),
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.settings_sharp,
                                          color: Color(0xFF369DD8),
                                          size: 35,
                                        ),
                                        title: Text(
                                          'Options',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 20,
                                                letterSpacing: 0,
                                              ),
                                        ),
                                        dense: false,
                                        contentPadding: EdgeInsets.all(10),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 5, 0, 0),
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.login_rounded,
                                          color: Color(0xFF369DD8),
                                          size: 35,
                                        ),
                                        title: Text(
                                          'Log Out',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 20,
                                                letterSpacing: 0,
                                              ),
                                        ),
                                        dense: false,
                                        contentPadding: EdgeInsets.all(10),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
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
                                      title: Text(
                                        'Contacts',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Outfit',
                                              letterSpacing: 0,
                                            ),
                                      ),
                                      dense: false,
                                      contentPadding: EdgeInsets.all(12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: Color(0xFF369DD8),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 5, 0, 0),
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.contact_page_rounded,
                                          color: Color(0xFF369DD8),
                                          size: 35,
                                        ),
                                        title: Text(
                                          'List',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 20,
                                                letterSpacing: 0,
                                              ),
                                        ),
                                        dense: false,
                                        contentPadding: EdgeInsets.all(10),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 5, 0, 0),
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.chat_bubble_rounded,
                                          color: Color(0xFF369DD8),
                                          size: 35,
                                        ),
                                        title: Text(
                                          'Chat',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 20,
                                                letterSpacing: 0,
                                              ),
                                        ),
                                        dense: false,
                                        contentPadding: EdgeInsets.all(10),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
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
                                      title: Text(
                                        'To Do List',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Outfit',
                                              letterSpacing: 0,
                                            ),
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_circle_right,
                                        color: Color(0xFF369DD8),
                                        size: 30,
                                      ),
                                      dense: false,
                                      contentPadding: EdgeInsets.all(12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
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
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: 100,
                    height: 941,
                    decoration: BoxDecoration(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
