import 'package:flutter/material.dart';

Widget buildSideBarItem({
  IconData? icon, // ICON TO BE DISPLAYED, CAN BE NULL
  String? imageUrl, // IMAGE URL FOR THE PROFILE PICTURE, CAN BE NULL
  required String text, // TEXT TO DISPLAY IN THE SIDEBAR ITEM
  required double borderQuantity, // BORDER RADIUS FOR THE CONTAINER
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 15.0),
    decoration: BoxDecoration(
      color: const Color(0xFF369DD8),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(borderQuantity),
      ),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        // CHECK IF ICON IS PROVIDED
        Center(
          child: AnimatedContainer(
            padding: const EdgeInsets.only(left: 20),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: icon != null
                ? Icon(
                    icon,
                    size: 35,
                    color: Colors.white,
                  )
                : imageUrl != null
                    ? CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(imageUrl),
                        child: null,
                      )
                    : const CircleAvatar(
                        radius: 25,
                        child: Icon(
                          Icons.person,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 200),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    ),
  );
}
