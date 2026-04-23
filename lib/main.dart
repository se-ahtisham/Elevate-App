// import 'package:elevate_app/Pages/Login_Screens/SignUp_Screen.dart';
// import 'package:elevate_app/Pages/Login_Screens/forget_password_screen.dart';
// import 'package:elevate_app/Pages/Login_Screens/login_screen.dart';
// import 'package:elevate_app/Pages/Splash_Screens/job_splash.dart';
// import 'package:elevate_app/Pages/User_Screens/Admin_Screens/Admin_Manage%20Screens/Admin_Manage_Job/admin_search_jobs.dart';
// import 'package:elevate_app/Pages/User_Screens/Admin_Screens/Admin_Manage%20Screens/Admin_Manage_Job_seeker/admin_manage_job_seeker.dart';
// import 'package:elevate_app/Pages/User_Screens/Admin_Screens/Admin_Manage%20Screens/admin_manage.dart';
// import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Seeker_Jobs_Screens/Job_screen.dart';
// import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Seeker_Testing_Screens/test_screen.dart';
// import 'package:elevate_app/Pages/Login_Screens/user_select.dart';
import 'package:elevate_app/Pages/Splash_Screens/job_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light, // Android
      statusBarBrightness: Brightness.dark, // iOS
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: JobSplash(),
      ),
    );
  }
}
