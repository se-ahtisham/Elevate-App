import 'package:elevate_app/Data_Model_Classes/job_model.dart';
import 'package:elevate_app/Navigations/job_seeker_bottom_navigation.dart';
import 'package:elevate_app/Pages/Login_Screens/user_select.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Seeker_Jobs_Screens/Job_screen.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Seeker_Jobs_Screens/job_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp( ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /*final job = Job(
      id: "0",
      title: "Flutter Developer",
      company: "Google",
      location: "Remote - Pakistan",
      description: "Build high-quality Flutter apps with clean architecture.",
      salary: "150k - 250k PKR",
      jobType: "Full Time",
      platform: "LinkedIn",
      isRemote: true,
      applyUrl: "https://careers.google.com",
    );
*/
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserSelect(),
    );
  }
}
