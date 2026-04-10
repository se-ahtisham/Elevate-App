<<<<<<< HEAD
<<<<<<< HEAD
import 'package:elevate_app/Navigations/company_bottom_navigation.dart';
import 'package:elevate_app/Navigations/job_seeker_bottom_navigation.dart';
import 'package:elevate_app/Pages/user_select.dart';
=======
import 'package:elevate_app/Custom_Widgets/Tiles/job_black_tile.dart';
import 'package:elevate_app/Pages/User_Screens/Admin_Screens/Admin_Manage%20Screens/admin_add_company.dart';
import 'package:elevate_app/Pages/User_Screens/Admin_Screens/Admin_Manage%20Screens/admin_manage_company.dart';
import 'package:elevate_app/Pages/User_Screens/Admin_Screens/Admin_Manage%20Screens/admin_manage_job_seekers.dart';
import 'package:elevate_app/Pages/User_Screens/Admin_Screens/Admin_Manage%20Screens/admin_dashboard_screen.dart';
import 'package:elevate_app/Pages/User_Screens/Admin_Screens/Admin_Manage%20Screens/admin_update_company.dart';
import 'package:elevate_app/Pages/User_Screens/Company_Screens/Company_Dashboard_Screens/comapany_employee_request.dart';
import 'package:elevate_app/Pages/User_Screens/Company_Screens/Company_Dashboard_Screens/company_view_user_post.dart';
import 'package:elevate_app/Pages/User_Screens/Company_Screens/Company_Posts_Screens/company_view_applied_candidate_profile_screen.dart';
import 'package:elevate_app/Pages/User_Screens/Company_Screens/Company_Posts_Screens/show_applied_candidates_screen.dart';
import 'package:elevate_app/Pages/User_Screens/Company_Screens/Company_Search_users_Screens/company_view_profile.dart';
import 'package:elevate_app/Pages/User_Screens/Company_Screens/Compnay_Profile_Screens/company_profile.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Seeker_Jobs_Screens/all_other_Api_jobs.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Seeker_Jobs_Screens/job_selection.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Seeker_Jobs_Screens/user_search_company.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Seeker_Testing_Screens/job_seeker_task_description_management.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Seeker_Testing_Screens/job_seeker_task_management.dart';
>>>>>>> origin/adminAddCompany
=======
import 'package:elevate_app/Pages/User_Screens/Company_Screens/Compnay_Profile_Screens/update_company_profile.dart';
>>>>>>> origin/updateCompanyProfile
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
      home: Scaffold(
        body: UserSelect(),
      ),
=======
      home: AdminAddCompanyScreen(),
>>>>>>> origin/adminAddCompany
=======
      home: AdminDashboardScreen(),
>>>>>>> origin/adminDashboardScreen
=======
      home: UpdateCompanyProfile(),
>>>>>>> origin/updateCompanyProfile
    );
  }
}
