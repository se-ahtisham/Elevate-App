import 'package:elevate_app/Data_Model_Classes/admin_model.dart';
import 'package:elevate_app/Data_Model_Classes/company_model.dart';
import 'package:elevate_app/Data_Model_Classes/job_seeker_model.dart';
import 'package:elevate_app/Pages/Login_Screens/login_screen.dart';
import 'package:elevate_app/Pages/Login_Screens/user_select.dart';
import 'package:elevate_app/Pages/admin_main.dart';
import 'package:elevate_app/Pages/company_main.dart';
import 'package:elevate_app/Pages/job_Seeker_main.dart';
import 'package:elevate_app/Providers/auth_provider.dart';
import 'package:elevate_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  // For env file
  await dotenv.load(fileName: ".env");

  // Firebase initialize
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // For theme
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

    Widget home = const LoginScreen();
    if (user is JobSeekerModel)
      home = JobSeekerMain(
        niche: "Graphics designer",
        experience: user.experienceLevel,
      );
    if (user is CompanyModel) home = const CompanyMain();
    if (user is AdminModel) home = const AdminMain();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: home,
    );
  }
}
