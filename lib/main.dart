
import 'package:elevate_app/Pages/Splash_Screens/ai_splash.dart';
import 'package:elevate_app/Pages/Splash_Screens/job_splash.dart';
import 'package:elevate_app/Pages/User_Screens/user_profile_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ElevateApp());
}

class ElevateApp extends StatelessWidget {
  const ElevateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,    
      home: UserProfileScreen(),                  
    );
  }
}