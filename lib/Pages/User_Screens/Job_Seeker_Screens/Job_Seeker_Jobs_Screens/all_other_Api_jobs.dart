import 'package:elevate_app/Custom_Widgets/Header/elevate_header.dart';
import 'package:elevate_app/Custom_Widgets/Search_Bar/custom_search_bar.dart';
import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:elevate_app/Custom_Widgets/Text/icon_text.dart';
import 'package:elevate_app/Custom_Widgets/Tiles/job_white_black_full_tile.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
/*Column
├ ElevateHeader
└ Expanded
   └ Padding
       └ Column
           ├ IconText
           ├ SizedBox
           ├ SearchBar
           ├ SizedBox
           └ Expanded */


class AllOtherApiJobs extends StatelessWidget {
  const AllOtherApiJobs({super.key});

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
              title: "JOBS FOR YOU",
              subTitle: "Skill-verified positions worldwide",
              titleSize: 40,
              subtitleSize: 14,
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, bottom: 50, right: 30),
                child: Column(
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
                      width: 370,
                      height: 60,
                      textSize: 15,
                      iconSize: 30,
                    ),

                    SizedBox(height: 20),

                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            JobWhiteBlackFullTile(
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

                            JobWhiteBlackFullTile(
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

                            JobWhiteBlackFullTile(
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

                            JobWhiteBlackFullTile(
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

                            JobWhiteBlackFullTile(
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

                            JobWhiteBlackFullTile(
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

                            JobWhiteBlackFullTile(
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
