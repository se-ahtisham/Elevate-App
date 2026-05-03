import 'package:elevate_app/Custom_Widgets/Drop_Down_Menu/custom_drop_down.dart';
import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Seeker_Jobs_Screens/Job_screen.dart';
import 'package:flutter/material.dart';

class NicheExpSelection extends StatefulWidget {
  const NicheExpSelection({super.key});

  @override
  State<NicheExpSelection> createState() => _NicheExpSelectionState();
}

class _NicheExpSelectionState extends State<NicheExpSelection> {
  String? niche;
  String? experience;

  final List<String> niches = [
    "Flutter",
    "Android",
    "iOS",
    "React Native",
    "Frontend",
    "Backend",
    "Full Stack",
    "DevOps",
    "Data Science",
    "Machine Learning",
    "UI/UX Design",
    "QA / Testing",
    "Product Manager",
    "Cybersecurity",
  ];

  final List<String> experiences = [
    "Intern",
    "Junior",
    "Mid-Level",
    "Senior",
    "Lead",
    "Manager",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(
              text: "Find Jobs",
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),

            const SizedBox(height: 30),

            /// NICHE
            CustomDropDown(
              hintText: "Select Niche",
              items: niches,
              value: niche,
              onChanged: (value) {
                setState(() {
                  niche = value;
                });
              },
            ),

            const SizedBox(height: 20),

            /// EXPERIENCE
            CustomDropDown(
              hintText: "Select Experience",
              items: experiences,
              value: experience,
              onChanged: (value) {
                setState(() {
                  experience = value;
                });
              },
            ),

            const SizedBox(height: 30),

            /// BUTTON
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  if (niche == null || experience == null) return;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                       // Direct now From here to job then job to other platfor jobs.
                          JobScreen(niche: niche!, experience: experience!),
                    ),
                  );
                },
                child: const CustomText(
                  text: "Search Jobs",
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
