import 'package:flutter/material.dart';
import 'package:sikada/config/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.to.background,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xFFF5F5F5),
            child: Icon(
              Icons.arrow_back,
              color: AppColors.to.primary,
              size: 20,
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
