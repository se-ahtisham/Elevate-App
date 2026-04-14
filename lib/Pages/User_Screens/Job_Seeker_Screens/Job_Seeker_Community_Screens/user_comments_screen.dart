import 'package:elevate_app/Custom_Widgets/Buttons/circle_icon_button.dart';
import 'package:elevate_app/Custom_Widgets/Text/icon_text.dart';
import 'package:elevate_app/Custom_Widgets/User_Widgets/user_comments.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';


/*UserCommentsScreen
└── Scaffold
    └── SafeArea
        └── Padding
            └── Column
                ├── Row
                │   ├── Expanded → IconText
                │   └── CircleIconButton
                ├── SizedBox
                └── Expanded
                    └── SingleChildScrollView
                        └── Column
                            ├── UserComments
                            ├── SizedBox
                            ├── UserComments
                            ├── SizedBox
                            └── ... (repeated UserComments + SizedBox) */

class UserCommentsScreen extends StatelessWidget {
  const UserCommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 214, 214),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: IconText(
                      text: "People Comment's",
                      iconData: Icons.people_alt_outlined,
                      textWeight: FontWeight.w600,
                      textSize: 17,
                    ),
                  ),
                  CircleIconButton(
                    iconData: Icons.arrow_back,
                    iconSize: 20,
                    iconColor: ElevateColor.white,
                    circleColor: ElevateColor.lightgray,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Expanded( // Becuase You put SingleChildScrollView inside a Column. 
              //Scroll view tries to take all space for all children → Column can’t contain it → overflow.
                child: SingleChildScrollView(
                  child: Column(
                  
                    children: [
                      UserComments(
                        userName: "Ahtisham Arshad",
                        usershortDescription: "Software Engineer",
                        image:
                            'https://avatars.githubusercontent.com/u/159082885?v=4',
                        commentText:
                            "The whole secret of existence lies in the pursuit of meaning, The whole secret of existence lies in the pursuit of meaning,  The whole secret of existence lies in the pursuit of meaning, purpose pursuit of meaning, purpose, and connection...",
                        textSize: 13,
                        textWeight: FontWeight.w400,
                        textAlign: TextAlign.justify,
                        lineHeight: 1.3,
                      ),
                      SizedBox(height: 20),
                        UserComments(
                        userName: "Ahtisham Arshad",
                        usershortDescription: "Software Engineer",
                        image:
                            'https://avatars.githubusercontent.com/u/159082885?v=4',
                        commentText:
                            "The whole secret of existence lies in the pursuit of meaning, purpose pursuit of meaning, purpose, and connection...",
                        textSize: 13,
                        textWeight: FontWeight.w400,
                        textAlign: TextAlign.justify,
                        lineHeight: 1.3,
                      ),
                      SizedBox(height: 20),
                        UserComments(
                        userName: "Ahtisham Arshad",
                        usershortDescription: "Software Engineer",
                        image:
                            'https://avatars.githubusercontent.com/u/159082885?v=4',
                        commentText:
                            "The whole secret of existence lies in the pursuit of meaning, purpose pursuit of meaning, purpose, and connection...",
                        textSize: 13,
                        textWeight: FontWeight.w400,
                        textAlign: TextAlign.justify,
                        lineHeight: 1.3,
                      ),
                      SizedBox(height: 20),
                        UserComments(
                        userName: "Ahtisham Arshad",
                        usershortDescription: "Software Engineer",
                        image:
                            'https://avatars.githubusercontent.com/u/159082885?v=4',
                        commentText:
                            "The whole secret of existence lies in the pursuit of meaning, purpose pursuit of meaning, purpose, and connection...",
                        textSize: 13,
                        textWeight: FontWeight.w400,
                        textAlign: TextAlign.justify,
                        lineHeight: 1.3,
                      ),
                      SizedBox(height: 20),
                        UserComments(
                        userName: "Ahtisham Arshad",
                        usershortDescription: "Software Engineer",
                        image:
                            'https://avatars.githubusercontent.com/u/159082885?v=4',
                        commentText:
                            "The whole secret of existence lies in the pursuit of meaning, purpose pursuit of meaning, purpose, and connection...",
                        textSize: 13,
                        textWeight: FontWeight.w400,
                        textAlign: TextAlign.justify,
                        lineHeight: 1.3,
                      ),
                      SizedBox(height: 20),
                        UserComments(
                        userName: "Ahtisham Arshad",
                        usershortDescription: "Software Engineer",
                        image:
                            'https://avatars.githubusercontent.com/u/159082885?v=4',
                        commentText:
                            "The whole secret of existence lies in the pursuit of meaning, purpose pursuit of meaning, purpose, and connection...",
                        textSize: 13,
                        textWeight: FontWeight.w400,
                        textAlign: TextAlign.justify,
                        lineHeight: 1.3,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
