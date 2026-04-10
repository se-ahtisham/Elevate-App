import 'package:elevate_app/Custom_Widgets/Buttons/text_button_gradient.dart';
import 'package:elevate_app/Navigations/admin_bottom_navigation.dart';
import 'package:elevate_app/Navigations/job_seeker_bottom_navigation.dart';
import 'package:flutter/material.dart';

class AdminMain extends StatelessWidget {
  const AdminMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: AdminBottomNavigation(),
      ),
    );
  }
}
