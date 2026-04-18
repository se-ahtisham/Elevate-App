import 'package:elevate_app/Custom_Widgets/Buttons/text_button_gradient.dart';
import 'package:elevate_app/Custom_Widgets/Buttons/texxt_button.dart';
import 'package:elevate_app/Custom_Widgets/Header/elevate_header.dart';
import 'package:elevate_app/Custom_Widgets/Test_Fields/custom_Text_Field.dart';
import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:elevate_app/Resources/Colors/Gradient_Colors/gradient_colors.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';

class AdminUpdateSkill extends StatefulWidget {
  const AdminUpdateSkill({super.key});

  @override
  State<AdminUpdateSkill> createState() => _AdminUpdateSkillState();
}

class _AdminUpdateSkillState extends State<AdminUpdateSkill> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  final int currentIndex = 1; // "Manage" tab is selected

  final navItems = [
    {'icon': Icons.home_outlined, 'label': ''},
    {'icon': Icons.list_alt_rounded, 'label': 'Manage'},
    {'icon': Icons.person_outline_rounded, 'label': ''},
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7), // Light off-white background to contrast the white circle
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Using the perfectly matching built-in ElevateHeader
            const ElevateHeader(
              title: "Elevate",
              subTitle: "Badges",
              titleSize: 26,
              subtitleSize: 26,
              titleLineHeight: 1.2,
              subtitleLineHeight: 1.2,
            ),
            
            const SizedBox(height: 30),
            
            // Image/Badge Uploader Circle
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  // TODO: Add image picker selection logic here
                },
                borderRadius: BorderRadius.circular(60),
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04), // soft shadow just to make the circle pop slightly on tap
                        blurRadius: 10,
                      )
                    ]
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      size: 45,
                      color: Color(0xFF888888), // More opaque/visible dark gray
                    ),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Input Fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller: _titleController,
                    hintText: "Skill Title",
                    hintColor: const Color(0xFF6E6E6E),
                    hintWeight: FontWeight.w600,
                    fontSize: 12,
                    underlineColor: const Color(0xFFDCDCDC),
                    cursorColor: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: _descController,
                    hintText: "Skill Description",
                    hintColor: const Color(0xFF6E6E6E),
                    hintWeight: FontWeight.w600,
                    fontSize: 12,
                    underlineColor: const Color(0xFFDCDCDC),
                    cursorColor: Colors.black,
                  ),
                  
                  const SizedBox(height: 50),
                  
                  // Action Buttons
                  TextButtonGradient(
                    text: "Update Skill",
                    buttonBackgroundColor: ElevateGradientColors.grayToBlack,
                    width: double.infinity,
                    height: 50,
                    borderRadius: 12,
                    textSize: 14,
                    textWeight: FontWeight.w600,
                    onTap: () {},
                  ),
                  const SizedBox(height: 15),
                  TexxtButton(
                    text: "Cancel",
                    backgroundColor: Colors.white,
                    borderColor: ElevateColor.black,
                    borderWidth: 1.2,
                    textColor: ElevateColor.black,
                    width: double.infinity,
                    height: 50,
                    borderRadius: 12,
                    textSize: 14,
                    textWeight: FontWeight.w600,
                    onTap: () {},
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
      
      // Re-using the floating bottom navigation pattern
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: ElevateColor.gray, width: 0.5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: List.generate(navItems.length, (i) {
              final item = navItems[i];
              bool selected = currentIndex == i;
              return Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedScale(
                      scale: selected ? 1.2 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        item['icon'] as IconData,
                        size: 20,
                        color: selected ? Colors.black : Colors.grey.shade400,
                      ),
                    ),
                    if (selected && item['label'] != "") ...[
                      const SizedBox(height: 4),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: CustomText(
                          text: item['label'] as String,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
