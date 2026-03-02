import 'package:flutter/material.dart';
import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final IconData iconData;
  final double iconSize;
  final Color iconColor;
  final double iconTextSpacing;
  final Color backgroundColor;
  final double borderRadius;
  final VoidCallback? onTap;

  const CustomSearchBar({
    super.key,
    required this.hintText,
    this.controller,
    this.iconData = Icons.search,
    this.iconSize = 24,
    this.iconColor = Colors.black,
    this.iconTextSpacing = 10,
    this.backgroundColor = const Color(0xFFF1F1F1),
    this.borderRadius = 40,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            size: iconSize,
            color: iconColor,
          ),
          SizedBox(width: iconTextSpacing),
          Expanded(
            child: TextField(
              controller: controller,
              onTap: onTap,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
              ),
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF1C1C3A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}