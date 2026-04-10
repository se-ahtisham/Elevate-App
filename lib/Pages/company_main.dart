import 'package:elevate_app/Custom_Widgets/Buttons/text_button_gradient.dart';
import 'package:elevate_app/Navigations/company_bottom_navigation.dart';
import 'package:elevate_app/Navigations/job_seeker_bottom_navigation.dart';
import 'package:flutter/material.dart';

class CompanyMain extends StatelessWidget {
  const CompanyMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CompanyBottomNavigation(),
      ),
    );
  }
}
