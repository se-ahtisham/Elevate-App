import 'package:elevate_app/Navigations/job_seeker_bottom_navigation.dart';
import 'package:flutter/material.dart';

class JobSeekerMain extends StatelessWidget {
  const JobSeekerMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: JobSeekerBottomNavigation()),
    );
  }
}
