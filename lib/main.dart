import 'package:elevate_app/Custom_Widgets/Company/employee_show.dart';
import 'package:elevate_app/Custom_Widgets/User_Widgets/user_post_new.dart';
import 'package:elevate_app/Pages/User_Screens/Company_Screens/Comapny_Dashboard_Screens/company_home_screen.dart';
import 'package:elevate_app/Pages/User_Screens/Company_Screens/Comapny_Dashboard_Screens/company_view_user_employee_request_profile.dart';
import 'package:elevate_app/Pages/User_Screens/Company_Screens/Comapny_Dashboard_Screens/company_view_user_post.dart';
import 'package:elevate_app/Pages/User_Screens/Company_Screens/Comapny_Dashboard_Screens/company_view_user_profile.dart';
import 'package:elevate_app/Pages/User_Screens/Company_Screens/Profile_Screens/company_profile_screen.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Screens/user_check_company_profile.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Screens/user_cold_email.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Screens/user_rating_company.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Testing_Screens/experience_coding.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Testing_Screens/hard_coding.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Testing_Screens/vibe_coding.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

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
      home: CompanyViewUserEmployeeRequestProfile(),
    );
  }
}
