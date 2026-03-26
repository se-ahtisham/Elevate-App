import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';

class AdminBadgeCreateCard extends StatelessWidget {
  final String code;
  final VoidCallback? onCreate;
  const AdminBadgeCreateCard({
    super.key,
    required this.code,
    this.onCreate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 118,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: ElevateColor.gray,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, size: 18, color: ElevateColor.gray),
          ),
          CustomText(
            text: code,
            fontSize: 13,
            color: ElevateColor.white,
            fontWeight: FontWeight.w700,
            lineHeight: 1.0,
            textAlign: TextAlign.center,
          ),
          GestureDetector(
            onTap: onCreate,
            child: Container(
              height: 28,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
              alignment: Alignment.center,
              child: CustomText(
                text: "CREATE NOW",
                fontSize: 10,
                color: ElevateColor.gray,
                fontWeight: FontWeight.w700,
                lineHeight: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

