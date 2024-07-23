import 'package:flutter/material.dart';

// CONTEXT MENU
Widget buildSideBarItem({
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
