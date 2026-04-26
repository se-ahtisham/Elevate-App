import "package:elevate_app/Animation/slide_left_route.dart";
import "package:elevate_app/Custom_Widgets/Buttons/icon_text_button.dart";
import "package:elevate_app/Custom_Widgets/Header/elevate_header.dart";
import "package:elevate_app/Custom_Widgets/Text/custom_text.dart";
import "package:elevate_app/Custom_Widgets/User_Widgets/user_description.dart";
import "package:elevate_app/Custom_Widgets/User_Widgets/user_education.dart";
import "package:elevate_app/Custom_Widgets/User_Widgets/user_skill.dart";
import "package:elevate_app/Custom_Widgets/User_Widgets/user_socialMedia.dart";
import "package:elevate_app/Custom_Widgets/User_Widgets/user_work.dart";
import "package:elevate_app/Navigations/job_seeker_bottom_navigation.dart";
import "package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Seeker_Profile_Screens/job_seeker_update_profile.dart";
import "package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart";
import "package:flutter/material.dart";
import 'package:flutter/services.dart';

/*StatelessWidget: UserProfileScreen
└── Scaffold (extendBodyBehindAppBar: true)
    └── AnnotatedRegion<SystemUiOverlayStyle>
        └── Container (height: infinity, color: white)
            └── SingleChildScrollView
                └── Column
                    ├── ElevateHeader (title, subTitle)
                    ├── Padding
                    │   └── UserDescription (imageURL, name, shortDescription, stats)
                    └── Padding
                        └── Column (crossAxisAlignment: start)
                            ├── Row (ABOUT ME + Update Button)
                            │   ├── CustomText ("ABOUT ME")
                            │   ├── SizedBox (width: 75)
                            │   └── IconTextButton ("Update Profile")
                            ├── SizedBox (height: 12)
                            ├── CustomText (About Description)
                            ├── SizedBox (height: 22)
                            ├── UserSocialmedia (city, country, email, phone)
                            ├── SizedBox (height: 22)
                            ├── Container (Experience Level Card)
                            │   └── Center
                            │       └── Column
                            │           ├── CustomText ("EXPERIENCE LEVEL")
                            │           ├── SizedBox (height: 8)
                            │           └── CustomText ("3-5 Year Experience")
                            ├── SizedBox (height: 22)
                            ├── CustomText ("EDUCATION")
                            ├── SizedBox (height: 15)
                            ├── Column
                            │   ├── UserEducation
                            │   ├── SizedBox (height: 15)
                            │   ├── UserEducation
                            │   ├── SizedBox (height: 15)
                            │   └── UserEducation
                            ├── SizedBox (height: 22)
                            ├── CustomText ("SKILL")
                            ├── SizedBox (height: 15)
                            ├── Column
                            │   ├── UserSkill
                            │   ├── SizedBox (height: 15)
                            │   └── UserSkill
                            ├── SizedBox (height: 22)
                            ├── CustomText ("WORK")
                            ├── SizedBox (height: 15)
                            └── Column
                                ├── UserWork
                                ├── SizedBox (height: 15)
                                └── UserWork */

class JobSeekerProfileScreen extends StatelessWidget {
  const JobSeekerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          color: Colors.white,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ElevateHeader(
                  title: "Your Digital Identity",
                  subTitle: "Account Control Center",
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 20),
                  child: UserDescription(
                    imageURL:
                        'https://avatars.githubusercontent.com/u/159082885?v=4',
                    name: "Muhammad Ahtisham",
                    shortDescription: "Backend Developer",
                    skills: 10,
                    followers: 238,
                    followings: 101,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: "ABOUT ME",
                            fontSize: 20,
                            color: ElevateColor.lightgray,
                            fontWeight: FontWeight.bold,
                          ),
                          const Spacer(),
                          IconTextButton(
                            text: "Update Profile",
                            iconData: Icons.settings,
                            onTap: () {
                              Navigator.push(
                                context,
                                SlideLeftRoute(page: JobSeekerUpdateProfile()),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
