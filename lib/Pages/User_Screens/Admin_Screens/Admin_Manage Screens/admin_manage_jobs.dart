import 'package:elevate_app/Custom_Widgets/Header/elevate_header.dart';
import 'package:elevate_app/Custom_Widgets/Search_Bar/custom_search_bar.dart';
import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:elevate_app/Custom_Widgets/Text/icon_text.dart';
import 'package:elevate_app/Custom_Widgets/User_Widgets/job_tile.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


/*Scaffold
├─ AnnotatedRegion<SystemUiOverlayStyle>
│  └─ Column
│     ├─ ElevateHeader
│     │    ├─ title: "Manage"
│     │    └─ subTitle: "Jobs"
│     └─ Expanded
│        └─ SingleChildScrollView
│           └─ Column (padding: left 30, right 30, bottom 50)
│              ├─ IconText ("Explore Jobs" + icon)
│              ├─ SizedBox(height: 15)
│              ├─ CustomSearchBar
│              ├─ SizedBox(height: 10)
│              ├─ SizedBox(height: 260)
│              │    └─ SingleChildScrollView
│              │         └─ Column
│              │             ├─ JobTile (Senior Flutter Developer)
│              │             ├─ SizedBox(height: 10)
│              │             ├─ JobTile (...)
│              │             └─ JobTile (...)
│              ├─ SizedBox(height: 10)
│              ├─ CustomText ("More For You")
│              ├─ SizedBox(height: 10)
│              └─ SizedBox(height: 260)
│                   └─ SingleChildScrollView
│                        └─ Column
│                            ├─ JobTile (...)
│                            ├─ SizedBox(height: 10)
│                            ├─ JobTile (...)
│                            └─ JobTile (...) */



class AdminManageJobs extends StatelessWidget {
  const AdminManageJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Column(
          children: [
            ElevateHeader(
              title: "Manage",
              subTitle: "Jobs",
              titleSize: 40,
              subtitleSize: 25,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 30, right: 30, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconText(
                      text: "Explore Jobs",
                      iconData: Icons.people_alt_outlined,
                      textSize: 20,
                      textWeight: FontWeight.bold,
                      iconSize: 25,
                      iconTextSpacing: 10,
                    ),
                    SizedBox(height: 15),
                    CustomSearchBar(
                      hintText: "Search Job",
                      backgroundColor: ElevateColor.white,
                      width: 380,
                      height: 60,
                      textSize: 15,
                      iconSize: 30,
                    ),
                    SizedBox(height:  10),
                    // Single child view for search out profiles with 150 height
                    SizedBox(
                      height: 260,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            JobTile(
                              titleText: "Senior Flutter Developer",
                              subtitleText: "Experience: 3-5 years",
                              jobTypeText: "Full-Time",
                              jobModeText: "Remote",
                              salaryText: "\$60k - \$80k",
                              tileHeight: 120,
                              blockFontSize: 9,
                              firstContainerWidth: 280,
                              secondContainerWidth: 70,
                              smallBoxWdith: 80,
                              onTap: null,
                              sizedBetween: 3,
                              spaceBetweenSubtitleBlocks: 20,
                              spaceBetweenTitleSubtitle: 10,
                            ),
                            SizedBox(height: 10),
                            JobTile(
                              titleText: "Senior Flutter Developer",
                              subtitleText: "Experience: 3-5 years",
                              jobTypeText: "Full-Time",
                              jobModeText: "Remote",
                              salaryText: "\$60k - \$80k",
                              tileHeight: 120,
                              blockFontSize: 9,
                              firstContainerWidth: 280,
                              secondContainerWidth: 70,
                              smallBoxWdith: 80,
                              onTap: null,
                              sizedBetween: 3,
                              spaceBetweenSubtitleBlocks: 20,
                              spaceBetweenTitleSubtitle: 10,
                            ),
                            SizedBox(height: 10),
                            JobTile(
                              titleText: "Senior Flutter Developer",
                              subtitleText: "Experience: 3-5 years",
                              jobTypeText: "Full-Time",
                              jobModeText: "Remote",
                              salaryText: "\$60k - \$80k",
                              tileHeight: 120,
                              blockFontSize: 9,
                              firstContainerWidth: 280,
                              secondContainerWidth: 70,
                              smallBoxWdith: 80,
                              onTap: null,
                              sizedBetween: 3,
                              spaceBetweenSubtitleBlocks: 20,
                              spaceBetweenTitleSubtitle: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: "More For You",
                      fontSize: 20,
                      color: ElevateColor.gray,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10),

                    // Single child view for rest all Profile
                    SizedBox(
                      height: 260,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            JobTile(
                              titleText: "Senior Flutter Developer",
                              subtitleText: "Experience: 3-5 years",
                              jobTypeText: "Full-Time",
                              jobModeText: "Remote",
                              salaryText: "\$60k - \$80k",
                              tileHeight: 120,
                              blockFontSize: 9,
                              firstContainerWidth: 280,
                              secondContainerWidth: 70,
                              smallBoxWdith: 80,
                              onTap: null,
                              sizedBetween: 3,
                              spaceBetweenSubtitleBlocks: 20,
                              spaceBetweenTitleSubtitle: 10,
                            ),
                            SizedBox(height: 10),
                            JobTile(
                              titleText: "Senior Flutter Developer",
                              subtitleText: "Experience: 3-5 years",
                              jobTypeText: "Full-Time",
                              jobModeText: "Remote",
                              salaryText: "\$60k - \$80k",
                              tileHeight: 120,
                              blockFontSize: 9,
                              firstContainerWidth: 280,
                              secondContainerWidth: 70,
                              smallBoxWdith: 80,
                              onTap: null,
                              sizedBetween: 3,
                              spaceBetweenSubtitleBlocks: 20,
                              spaceBetweenTitleSubtitle: 10,
                            ),
                            SizedBox(height: 10),
                            JobTile(
                              titleText: "Senior Flutter Developer",
                              subtitleText: "Experience: 3-5 years",
                              jobTypeText: "Full-Time",
                              jobModeText: "Remote",
                              salaryText: "\$60k - \$80k",
                              tileHeight: 120,
                              blockFontSize: 9,
                              firstContainerWidth: 280,
                              secondContainerWidth: 70,
                              smallBoxWdith: 80,
                              onTap: null,
                              sizedBetween: 3,
                              spaceBetweenSubtitleBlocks: 20,
                              spaceBetweenTitleSubtitle: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
