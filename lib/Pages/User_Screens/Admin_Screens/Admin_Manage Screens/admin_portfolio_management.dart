import 'package:elevate_app/Custom_Widgets/Header/elevate_header.dart';
import 'package:elevate_app/Custom_Widgets/Search_Bar/custom_search_bar.dart';
import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:elevate_app/Custom_Widgets/Tiles/admin_portfolio_tile.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdminPortfolioManagement extends StatefulWidget {
  const AdminPortfolioManagement({super.key});

  @override
  State<AdminPortfolioManagement> createState() => _AdminPortfolioManagementState();
}

class _AdminPortfolioManagementState extends State<AdminPortfolioManagement> {
  final List<String> portfolios = const [
    "E-Commerce\nMobile Application",
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 32;

    return Scaffold(
      backgroundColor: ElevateColor.white,
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Column(
          children: [
            SizedBox(
              height: 230,
              child: Stack(
                children: const [
                  ElevateHeader(
                    title: "",
                    subTitle: "",
                    titleSize: 22,
                    subtitleSize: 16,
                    height: 230,
                    showSmallLogo: false,
                  ),
                  Positioned(
                    top: 42,
                    left: 20,
                    child: SafeArea(
                      bottom: false,
                      child: CustomText(
                        text: "Elevate",
                        fontSize: 35,
                        color: ElevateColor.white,
                        fontWeight: FontWeight.w400,
                        lineHeight: 1.0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 52,
                    child: CustomText(
                      text: "Manage",
                      fontSize: 25,
                      color: ElevateColor.white,
                      fontWeight: FontWeight.w700,
                      lineHeight: 1.0,
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 24,
                    child: CustomText(
                      text: "Job Seeker",
                      fontSize: 22,
                      color: ElevateColor.white,
                      fontWeight: FontWeight.w400,
                      lineHeight: 1.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: ElevateColor.white,
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.hub_outlined,
                          size: 14,
                          color: ElevateColor.gray,
                        ),
                        SizedBox(width: 6),
                        CustomText(
                          text: "Explore Portfolio",
                          fontSize: 20,
                          color: ElevateColor.gray,
                          fontWeight: FontWeight.w700,
                          lineHeight: 1.0,
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Container(
                      decoration: BoxDecoration(
                        color: ElevateColor.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: const Color(0xFFE9E9E9)),
                      ),
                      child: CustomSearchBar(
                        hintText: "Ecommerce Mobile application",
                        iconData: Icons.search_rounded,
                        iconSize: 19,
                        iconColor: ElevateColor.gray,
                        iconTextSpacing: 8,
                        backgroundColor: Colors.transparent,
                        borderRadius: 30,
                        height: 40,
                        width: width,
                        textSize: 12,
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: ListView.builder(
                        itemCount: portfolios.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: AdminPortfolioTile(
                              title: portfolios[index],
                              onTap: () {},
                            ),
                          );
                        },
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
