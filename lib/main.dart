import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Seeker_Jobs_Screens/userSearchCompany.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Seeker_Testing_Screens/jobSeekerTaskDescriptionManagement.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Seeker_Testing_Screens/jobSeekerTaskManagement.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Usersearchcompany(),
    );
  }
}
