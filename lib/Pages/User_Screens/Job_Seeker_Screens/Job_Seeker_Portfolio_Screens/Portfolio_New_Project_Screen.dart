import 'package:elevate_app/Custom_Widgets/Buttons/contain_icon_text_button.dart';
import 'package:elevate_app/Custom_Widgets/Buttons/text_button_gradient.dart';
import 'package:elevate_app/Custom_Widgets/Header/elevate_header.dart';
import 'package:elevate_app/Custom_Widgets/Test_Fields/custom_Text_Field.dart';
import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';

class PortfolioNewProjectScreen extends StatefulWidget {
  const PortfolioNewProjectScreen({super.key});

  @override
  State<PortfolioNewProjectScreen> createState() =>
      _PortfolioNewProjectScreenState();
}

class _PortfolioNewProjectScreenState extends State<PortfolioNewProjectScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final navItems = [
    {'icon': 'lib/Resources/Icons/Home.svg', 'label': 'Home'},
    {'icon': 'lib/Resources/Icons/Test.svg', 'label': 'Tests'},
    {'icon': 'lib/Resources/Icons/Network.svg', 'label': 'Network'},
    {'icon': 'lib/Resources/Icons/Portfolio.svg', 'label': 'Portfolio'},
    {'icon': 'lib/Resources/Icons/Profile.svg', 'label': 'Profile'},
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9), // Light background to match mock
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: ElevateColor.gray),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(30),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: List.generate(navItems.length, (i) {
              final item = navItems[i];
              bool selected = 3 == i; // Hardcoding index 3 for Portfolio

              return Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedScale(
                        scale: selected ? 1.3 : 1.0,
                        duration: const Duration(milliseconds: 200),
                        child: SvgPicture.asset(
                          item['icon'] as String,
                          height: 22,
                          colorFilter: ColorFilter.mode(
                            selected ? Colors.black : Colors.grey,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      if (selected) ...[
                        const SizedBox(height: 4),
                        CustomText(
                          text: item['label'] as String,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const ElevateHeader(),

            // Form Area
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'UPLOAD IMAGES',
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF4A4A4A),
                  ),
                  const SizedBox(height: 12),
                  
                  // Box for uploading images
                  GestureDetector(
                    onTap: () {
                      // TODO: Implement image picker logic here
                    },
                    child: Container(
                      height: 130,
                      width: 160,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          size: 40,
                          color: Color(0xFFCCCCCC),
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  CustomTextField(
                    controller: _titleController,
                    hintText: 'Title',
                    cursorColor: Colors.black,
                    underlineColor: const Color(0xFFE0E0E0),
                    fontSize: 12,
                    hintColor: const Color(0xFFAAAAAA),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  CustomTextField(
                    controller: _descriptionController,
                    hintText: 'Description',
                    cursorColor: Colors.black,
                    underlineColor: const Color(0xFFE0E0E0),
                    fontSize: 12,
                    hintColor: const Color(0xFFAAAAAA),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  const CustomText(
                    text: 'Files',
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF4A4A4A),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  ContainIconTextButton(
                    onTap: () {
                      // TODO: Implement file picker logic here
                    },
                    text: 'Add Files',
                    height: 45,
                    backgroundColor: const Color(0xFFEEEEEE),
                    textColor: const Color(0xFF888888),
                    iconColor: const Color(0xFF888888),
                    iconBorderColor: const Color(0xFF888888),
                    iconSize: 16,
                    iconContainerSize: 24,
                    textSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  
                  const SizedBox(height: 40),
                  
                  TextButtonGradient(
                    text: 'ADD PROJECT',
                    height: 55,
                    width: double.infinity,
                    textSize: 12,
                    textWeight: FontWeight.bold,
                    borderRadius: 12,
                    onTap: () {
                      // ADD PROJECT LOGIC
                    },
                  ),
                  
                  // Bottom padding to avoid navigation bar clipping if applicable
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
