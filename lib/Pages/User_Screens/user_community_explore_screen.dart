import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:elevate_app/Custom_Widgets/User_Widgets/user_post.dart';
import 'package:elevate_app/Custom_Widgets/User_Widgets/user_post_new.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';

// Due to testfield controler
class UserCommunityExploreScreen extends StatefulWidget {
  const UserCommunityExploreScreen({super.key});

  @override
  State<UserCommunityExploreScreen> createState() =>
      _UserCommunityExploreScreenState();
}

class _UserCommunityExploreScreenState
    extends State<UserCommunityExploreScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController shortDescriptionController =
      TextEditingController();
  @override
  void dispose() {
    titleController.dispose();
    shortDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),

          UserPostNew(
            hintTitle: "Post Title",
            hintText: "Post Description",
            imageURL:
                "lib/Resources/Images/Profile_Images/ahtisham_Profile_image.jpg",
            name: "Ahtisham Arshad",
            shortDescription: "Flutter Developer",
            titleController: titleController,
            shortDescriptionController: shortDescriptionController,
            onPost: () {},
          ),

          SizedBox(height: 30),

          CustomText(
            text: "What’s other Posted",
            fontSize: 16,
            color: ElevateColor.lightgray,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.left,
            lineHeight: 0.1,
          ),

          UserPost(
            userName: "Ahtisham Arshad",
            usershortDescription: "Software Engineer",
            image:
                'lib/Resources/Images/Profile_Images/ahtisham_Profile_image.jpg',
            postTitle: "The Existing of why no other",
            postText:
                "The whole secret of existence lies in the pursuit of meaning, The whole secret of existence lies in the pursuit of meaning,  The whole secret of existence lies in the pursuit of meaning, purpose pursuit of meaning, purpose, and connection...",
            textSize: 13,
            textWeight: FontWeight.w400,
            textAlign: TextAlign.justify,
            lineHeight: 1.3,
            commentCount: 24,
          ),
          UserPost(
            userName: "Ahtisham Arshad",
            usershortDescription: "Software Engineer",
            image:
                'lib/Resources/Images/Profile_Images/ahtisham_Profile_image.jpg',
            postTitle: "The Existing of why no other",
            postText:
                "The whole secret of existence lies in the pursuit of meaning, The whole secret of existence lies in the pursuit of meaning,  The whole secret of existence lies in the pursuit of meaning, purpose pursuit of meaning, purpose, and connection...",
            textSize: 13,
            textWeight: FontWeight.w400,
            textAlign: TextAlign.justify,
            lineHeight: 1.3,
            commentCount: 35,
          ),

          SizedBox(height: 40),
        ],
      ),
    );
  }
}
