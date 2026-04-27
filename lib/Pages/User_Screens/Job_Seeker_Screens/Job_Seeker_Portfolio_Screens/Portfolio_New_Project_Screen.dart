import 'package:elevate_app/Custom_Widgets/Buttons/contain_icon_text_button.dart';
import 'package:elevate_app/Custom_Widgets/Buttons/text_button_gradient.dart';
import 'package:elevate_app/Custom_Widgets/Header/elevate_header.dart';
import 'package:elevate_app/Custom_Widgets/Test_Fields/custom_Text_Field.dart';
import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:flutter/material.dart';
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

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const ElevateHeader(),

            // Form Area
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 20.0,
              ),
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
