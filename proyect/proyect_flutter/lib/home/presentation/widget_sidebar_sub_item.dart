import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// MENU ITEM
Widget buildSideBarSubItem({
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
        padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.horizontal(left: Radius.circular(40)),
          border: Border(
            top: BorderSide(
              color: isHovering ? const Color(0xFF369DD8) : Colors.transparent,
              width: 2,
            ),
            bottom: BorderSide(
              color: isHovering ? const Color(0xFF369DD8) : Colors.transparent,
              width: 2,
            ),
            left: BorderSide(
              color: isHovering ? const Color(0xFF369DD8) : Colors.transparent,
              width: 2,
            ),
          ),
          color: isHovering
              ? const Color(0xFF369DD8).withOpacity(0.05)
              : Colors.transparent,
        ),
        child: ListTile(
          mouseCursor: SystemMouseCursors.click,
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
