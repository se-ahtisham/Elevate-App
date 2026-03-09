import 'package:elevate_app/Custom_Widgets/Buttons/text_button_gradient.dart';
import 'package:elevate_app/Custom_Widgets/Buttons/texxt_button.dart';
import 'package:elevate_app/Custom_Widgets/Header/elevate_header.dart';
import 'package:elevate_app/Custom_Widgets/Test_Fields/custom_Text_Field.dart';
import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:elevate_app/Resources/Colors/Gradient_Colors/gradient_colors.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TaskManagementScreen extends StatefulWidget {
  const TaskManagementScreen({super.key});

  @override
  State<TaskManagementScreen> createState() => _TaskManagementScreenState();
}

class _TaskManagementScreenState extends State<TaskManagementScreen> {
  TextEditingController jobSeekerIdController = TextEditingController();
  TextEditingController taskIdController = TextEditingController();

  @override
  void dispose() {
    taskIdController.dispose();
    jobSeekerIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Column(
          children: [
            ElevateHeader(
              title: "Elevate",
              subTitle: "Task",
              titleSize: 40,
              subtitleSize: 25,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 380,
                      height: 240,
                      decoration: BoxDecoration(
                        gradient: ElevateGradientColors.grayToBlack,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 25),
                        
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30.0,
                              ),
                              child: CustomTextField(
                                controller: jobSeekerIdController,
                                hintText: "Job Seeker ID",
                                cursorColor: const Color.fromARGB(
                                  255,
                                  255,
                                  255,
                                  255,
                                ),
                                underlineColor: const Color.fromARGB(
                                  255,
                                  214,
                                  214,
                                  214,
                                ),
                                textColor: ElevateColor.gray,
                                hintColor: const Color.fromARGB(
                                  255,
                                  214,
                                  214,
                                  214,
                                ),
                                hintWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30.0,
                              ),
                              child: CustomTextField(
                                controller: taskIdController,
                                hintText: "Task ID",
                                cursorColor: const Color.fromARGB(
                                  255,
                                  255,
                                  255,
                                  255,
                                ),
                                underlineColor: const Color.fromARGB(
                                  255,
                                  214,
                                  214,
                                  214,
                                ),
                                textColor: ElevateColor.gray,
                                hintColor: const Color.fromARGB(
                                  255,
                                  214,
                                  214,
                                  214,
                                ),
                                hintWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 40),
                            TexxtButton(
                              text: "Search",
                              height: 40,
                              width: 280,
                              textSize: 14,
                              textColor: ElevateColor.gray,
                              textWeight: FontWeight.bold,
                              borderRadius: 50,
                              backgroundColor: ElevateColor.white,
                              borderColor: ElevateColor.gray,
                              borderWidth: 0,
                              onTap: null,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    // Description
                    CustomText(
                      text: "Description",
                      fontSize: 16,
                      color: ElevateColor.lightgray,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 6),
                    CustomText(
                      text:
                          "We are seeking a talented UI/UX Designer to join our team and craft engaging, user-friendly digital experiences. You will be responsible for designing",
                      fontSize: 12,
                      color: ElevateColor.lightgray,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 45),

                    // Delete Button
                    TextButtonGradient(
                      text: "Delete Task",
                      height: 50,
                      textSize: 14,
                      textWeight: FontWeight.w400,
                      borderRadius: 50,
                      onTap: null,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
