// Function to create section titles
import 'package:flutter/material.dart';
import 'package:sikada/config/colors.dart';

Widget buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
    ),
  );
}

// Function to create ListTiles
Widget buildListTile(IconData icon, String text, {bool isLogout = false}) {
  return ListTile(
    contentPadding: EdgeInsets.all(0),
    leading: CircleAvatar(
      backgroundColor: Color.fromARGB(255, 246, 248, 248),
      child: Icon(icon, color: isLogout ? Colors.red : AppColors.to.primary),
    ),
    title: Text(text, style: TextStyle(fontSize: 16)),
    trailing: isLogout
        ? null
        : Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.to.keyLight),
    onTap: () {
      if (isLogout) {
        // Handle Logout action
      }
    },
  );
}
