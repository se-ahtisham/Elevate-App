import "package:elevate_app/Custom_Widgets/Buttons/icon_text_button.dart";
import "package:elevate_app/Custom_Widgets/Header/elevate_header.dart";
import "package:elevate_app/Custom_Widgets/Text/custom_text.dart";
import "package:elevate_app/Custom_Widgets/User_Widgets/user_description.dart";
import "package:elevate_app/Custom_Widgets/User_Widgets/user_socialMedia.dart";
import "package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart";
import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          height: double.infinity,
          color: Colors.white,
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
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: "ABOUT ME",
                            fontSize: 20,
                            color: ElevateColor.lightgray,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.left,
                            lineHeight: 1.0,
                          ),
                          SizedBox(width: 75),
                          IconTextButton(
                            text: "Update Profile",
                            iconData: Icons.settings,
                            backgroundColor: ElevateColor.white,
                            iconColor: ElevateColor.lightgray,
                            textColor: ElevateColor.gray,
                            textWeight: FontWeight.bold,
                            borderColor: ElevateColor.gray,
                            borderRadius: 50,
                            textSize: 12,
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      CustomText(
                        text:
                            "I’m web designer, I work in programs like figma, adobe photoshop, adobe illustratoI’m web designer, I work in programs like figma, adobe photoshop, adobe illustrator",
                        fontSize: 13,
                        color: ElevateColor.whitegray,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.justify,
                        lineHeight: 1.3,
                      ),
                      SizedBox(height: 22),
                      UserSocialmedia(
                        city: "Lahore",
                        country: "Pakistan",
                        email: "se.ahtisham@gmail.com",
                        phone: "03000000000",
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
