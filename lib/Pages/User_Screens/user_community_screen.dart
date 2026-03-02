import 'package:elevate_app/Custom_Widgets/Buttons/circle_icon_button.dart';
import 'package:elevate_app/Custom_Widgets/Text/icon_text.dart';
import 'package:elevate_app/Navigations/community_navigation/community_navigation.dart';
import 'package:elevate_app/Pages/User_Screens/user_community_explore_screen.dart';
import 'package:elevate_app/Pages/User_Screens/user_community_myCommunity_screen.dart';
import 'package:elevate_app/Pages/User_Screens/user_community_myPost_screen.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';

class UserCommunityScreen extends StatelessWidget {
  const UserCommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            children: [
              IconText(
                text: "People Comment's",
                iconData: Icons.people_alt_outlined,
                textWeight: FontWeight.w600,
                textSize: 20,
                iconSize: 30,
                iconTextSpacing: 10,
              ),
              SizedBox(height: 15),
              Expanded(
                child: TopNavigation(
                  titles: ["Explore", "My Communities", "My Post"],
                  screens: [
                    UserCommunityExploreScreen(),
                    UserCommunityMycommunityScreen(),
                    UserCommunityMypostScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
