import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
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

  final double height;
final double? width;
  final double textSize;

  const CustomSearchBar({
    super.key,
    required this.hintText,
    this.controller,
    this.iconData = Icons.search,
    this.iconSize = 24,
    this.height = 60,
    this.width = 18,
    this.textSize = 18,
    this.iconColor = Colors.black,
    this.iconTextSpacing = 10,
    this.backgroundColor = const Color(0xFFF1F1F1),
    this.borderRadius = 40,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(iconData, size: iconSize, color: iconColor),
          SizedBox(width: iconTextSpacing),
          Expanded(
            child: TextField(
              controller: controller,
              cursorColor: ElevateColor.gray,
              onTap: onTap,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                isDense: true,
                // contentPadding: const EdgeInsets.symmetric(vertical: 15),
              ),
              style: TextStyle(fontSize: textSize, color: Color(0xFF1C1C3A)),
            ),
          ),
        ],
      ),
    );
  }
}
