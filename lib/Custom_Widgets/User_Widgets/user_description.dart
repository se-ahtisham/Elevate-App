import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';

/*
StatelessWidget: UserDescription
└── Column (crossAxisAlignment: start)
    ├── CustomText (name)
    ├── CustomText (shortDescription)
    ├── SizedBox (height: 10)
    └── Row
        ├── Column (Skills)
        │   ├── CustomText (skills count)
        │   └── CustomText ("SKILLS")
        ├── SizedBox (width: 20)
        ├── Container (divider)
        ├── SizedBox (width: 20)
        ├── Column (Followers)
        │   ├── CustomText (followers count)
        │   └── CustomText ("Followers")
        ├── SizedBox (width: 20)
        ├── Container (divider)
        ├── SizedBox (width: 20)
        └── Column (Following)
            ├── CustomText (followings count)
            └── CustomText ("Following")
*/

class UserDescription extends StatelessWidget {
  final String name;
  final String shortDescription;
  final int skills;
  final int followings;
  final int followers;

  const UserDescription({
    super.key,

    required this.name,
    this.shortDescription = "",
    this.skills = 0,
    this.followings = 0,
    this.followers = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name tag
        CustomText(
          text: name,
          fontSize: 18,
          color: ElevateColor.lightgray,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.left,
          lineHeight: 1.0,
        ),
        CustomText(
          text: shortDescription,
          fontSize: 12,
          color: ElevateColor.black,
          fontWeight: FontWeight.normal,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 10),
        Row(
          children: [
            // Skill Column
            Column(
              children: [
                CustomText(
                  text: skills.toString(),
                  fontSize: 18,
                  lineHeight: 1,
                  fontWeight: FontWeight.w600,
                  color: ElevateColor.gray,
                ),
                CustomText(text: "SKILLS", fontSize: 10),
              ],
            ),
            SizedBox(width: 20),
            Container(width: 1, height: 35, color: ElevateColor.gray),
            SizedBox(width: 20),
            // Followers Column
            Column(
              children: [
                CustomText(
                  text: followers.toString(),
                  fontSize: 18,
                  lineHeight: 1,
                  fontWeight: FontWeight.w600,
                  color: ElevateColor.gray,
                ),
                CustomText(text: "Followers", fontSize: 10),
              ],
            ),
            SizedBox(width: 20),
            Container(width: 1, height: 35, color: ElevateColor.gray),
            SizedBox(width: 20),
            // Following Column
            Column(
              children: [
                CustomText(
                  text: followings.toString(),
                  fontSize: 18,
                  lineHeight: 1,
                  fontWeight: FontWeight.w600,
                  color: ElevateColor.gray,
                ),
                CustomText(text: "Following", fontSize: 10),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
