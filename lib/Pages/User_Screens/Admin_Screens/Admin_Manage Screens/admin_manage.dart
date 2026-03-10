import 'package:elevate_app/Custom_Widgets/Header/elevate_header.dart';
import 'package:elevate_app/Custom_Widgets/Tiles/manageWhiteBlackFull.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdminManage extends StatelessWidget {
  const AdminManage({super.key});

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
              title: "Now It's",
              subTitle: "Your Time",
              titleSize: 40,
              subtitleSize: 18,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 40),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Managewhiteblackfull(
                        titleText: 'Manage',
                        subtitleText: 'JOB SEEKERS',
                        firstContainerWidth: 240,
                        titleFontSize: 23,
                        subtitleFontSize: 30,
                        tileHeight: 100,
                        lineHeight: 1,
                        firstContainerColor: ElevateColor.white,
                        
                      ),
                      SizedBox(height: 20),
                      Managewhiteblackfull(
                        titleText: 'Manage',
                        subtitleText: 'COMPANIES',
                        firstContainerWidth: 240,
                        titleFontSize: 23,
                        subtitleFontSize: 30,
                        tileHeight: 100,
                        lineHeight: 1,
                        firstContainerColor: ElevateColor.white,
                      ),
                      SizedBox(height: 20),
                      Managewhiteblackfull(
                        titleText: 'Manage',
                        subtitleText: 'JOBS',
                        firstContainerWidth: 240,
                        titleFontSize: 23,
                        subtitleFontSize: 30,
                        tileHeight: 100,
                        lineHeight: 1,
                        firstContainerColor: ElevateColor.white,
                         
                      ),
                      SizedBox(height: 20),
                      Managewhiteblackfull(
                        titleText: 'Manage',
                        subtitleText: 'SKILLS',
                        firstContainerWidth: 240,
                        titleFontSize: 23,
                        subtitleFontSize: 30,
                        tileHeight: 100,
                        lineHeight: 1,
                        firstContainerColor: ElevateColor.white,
                         
                      ),
                      SizedBox(height: 20),
                      Managewhiteblackfull(
                        titleText: 'Manage',
                        subtitleText: 'BADGES',
                        firstContainerWidth: 240,
                        titleFontSize: 23,
                        subtitleFontSize: 30,
                        tileHeight: 100,
                        lineHeight: 1,
                        firstContainerColor: ElevateColor.white,
                         
                      ),
                      SizedBox(height: 20),
                      Managewhiteblackfull(
                        titleText: 'Manage',
                        subtitleText: 'PORTFOLIOS',
                        firstContainerWidth: 240,
                        titleFontSize: 23,
                        subtitleFontSize: 30,
                        tileHeight: 100,
                        lineHeight: 1,
                        firstContainerColor: ElevateColor.white,
                         
                      ),
                      SizedBox(height: 20),
                      Managewhiteblackfull(
                        titleText: 'Manage',
                        subtitleText: 'ASSESSMENT',
                        firstContainerWidth: 240,
                        titleFontSize: 23,
                        subtitleFontSize: 30,
                        tileHeight: 100,
                        lineHeight: 1,
                        firstContainerColor: ElevateColor.white,
                         
                      ),
                      SizedBox(height: 20),
                      Managewhiteblackfull(
                        titleText: 'Manage',
                        subtitleText: 'COMMUNITY',
                        firstContainerWidth: 240,
                        titleFontSize: 23,
                        subtitleFontSize: 30,
                        tileHeight: 100,
                        lineHeight: 1,
                        firstContainerColor: ElevateColor.white,
                         
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
