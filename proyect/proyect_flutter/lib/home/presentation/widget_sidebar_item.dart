import 'package:flutter/material.dart';

Widget buildSideBarItem({
  required IconData icon,
  required String text,
  required double borderQuantity,
}) {
  return Container(
    padding: const EdgeInsets.only(top: 18.0, right: 0.0, left: 20.0, bottom: 20.0),
    decoration: BoxDecoration(
      color: const Color(0xFF369DD8),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(borderQuantity),
      ),
    ),
    child: Row(
      children: [
        Icon(
          icon,
          size: 40,
          color: Colors.white,
        ),
        const SizedBox(width: 20),
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
