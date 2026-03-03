
import 'package:elevate_app/Custom_Widgets/User_Widgets/user_post_new.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Coding_Screens/experience_coding.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Coding_Screens/hard_coding.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Coding_Screens/vibe_coding.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:elevate_app/Pages/portfolio/portfolio_description_screen.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(
  SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light, // Android
    statusBarBrightness: Brightness.dark,      // iOS
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
      home: VibeCoding(),
    );
  }
}
