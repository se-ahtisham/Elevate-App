import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Seeker_Jobs_Screens/all_other_Api_jobs.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Seeker_Jobs_Screens/job_selection.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Seeker_Jobs_Screens/user_search_company.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Seeker_Testing_Screens/job_seeker_task_description_management.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Seeker_Testing_Screens/job_seeker_task_management.dart';
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
      home: JobSelection(imageURL:
                        'lib/Resources/Images/Profile_Images/Company_Logo.jpg',
                    name: 'Elevate Inc.',
                    shortDescription: 'Innovating your future',
                    description: """Thank you for reaching out and considering me for the UI/UX Designer position at MIcrosoft. I appreciate you sharing the details of the role and I am very excited about the opportunity to contribute to your team.
With my experience in designing user-friendly interfaces and creating seamless user experiences for both web and mobile applications, I am confident in my ability to add value to your projects. I have worked extensively with tools like Figma, Adobe XD, and Sketch, and I am passionate about user-centered design, wireframing, prototyping, and conducting usability research.
I would love to learn more about your team, current projects, and how I can support your vision.""",),
    );
  }
}
