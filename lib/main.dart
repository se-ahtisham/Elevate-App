import 'package:elevate_app/Pages/User_Screens/Admin_Screens/Admin_Manage%20Screens/admin_update_company_profile.dart';
import 'package:elevate_app/Pages/User_Screens/Admin_Screens/Admin_Manage%20Screens/admin_update_job_seeker.dart';
import 'package:elevate_app/Pages/User_Screens/Company_Screens/Compnay_Profile_Screens/company_profile.dart';
import 'package:elevate_app/Pages/user_select.dart';
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
      home: Scaffold(body: AdminUpdateCompanyProfile()),
    );
  }
}
