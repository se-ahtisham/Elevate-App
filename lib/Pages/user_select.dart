import 'package:elevate_app/Animation/slide_left_route.dart';
import 'package:elevate_app/Animation/slide_right_route.dart';
import 'package:elevate_app/Custom_Widgets/Buttons/text_button_gradient.dart';
import 'package:elevate_app/Pages/admin_main.dart';
import 'package:elevate_app/Pages/company_main.dart';
import 'package:elevate_app/Pages/job_seeker_main.dart';
import 'package:flutter/material.dart';

class UserSelect extends StatelessWidget {
  const UserSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 150),
              TextButtonGradient(
                text: "Job Seeker",
                width: 200,
                height: 80,
                textSize: 20,
                textWeight: FontWeight.bold,
                borderRadius: 50,
                onTap: () {
                  Navigator.push(context, SlideLeftRoute(page: JobSeekerMain()));
                }
              ),
              SizedBox(height: 20),

              TextButtonGradient(
                text: "Company",
                width: 200,
                height: 80,
                textSize: 20,
                textWeight: FontWeight.bold,
                borderRadius: 50,
                onTap: () {
                  Navigator.push(context, SlideLeftRoute(page: CompanyMain()));
                },
              ),
              SizedBox(height: 20),
              TextButtonGradient(
                text: "Admin",
                width: 200,
                height: 80,
                textSize: 20,
                textWeight: FontWeight.bold,
                borderRadius: 50,
                onTap: () {
                  Navigator.push(context, SlideLeftRoute(page: AdminMain()));
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
