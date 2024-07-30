import 'package:flutter/material.dart';

Widget buildSideBarItem({
  IconData? icon,                 // ICON TO BE DISPLAYED, CAN BE NULL
  String? imageUrl,               // IMAGE URL FOR THE PROFILE PICTURE, CAN BE NULL
  required String text,           // TEXT TO DISPLAY IN THE SIDEBAR ITEM
  required double borderQuantity, // BORDER RADIUS FOR THE CONTAINER
}) {
  return Container(
    padding: const EdgeInsets.only(
      top: 18.0, 
      right: 0.0, 
      left: 20.0, 
      bottom: 20.0
    ),
    decoration: BoxDecoration(
      color: const Color(0xFF369DD8),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(borderQuantity),
      ),
    ),
    child: Row(
      children: [
        // DISPLAY AN ICON IF PROVIDED, OTHERWISE DISPLAY A CIRCLEAVATAR
        icon != null 
            ? Icon(
                icon,
                size: 40,
                color: Colors.white,
              )
            : CircleAvatar(
                radius: 25,
                backgroundImage: imageUrl != null
                    ? AssetImage(imageUrl) // USING ASSET IMAGE FOR REMOTE URLS
                    : null,
                child: imageUrl == null 
                    ? const Icon(
                        Icons.person, // DEFAULT ICON IF NO IMAGE IS AVAILABLE
                        size: 30,
                        color: Colors.white,
                      )
                    : null,
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