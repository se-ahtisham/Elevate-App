import 'package:elevate_app/Custom_Widgets/Search_Bar/custom_search_bar.dart';
import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:elevate_app/Custom_Widgets/Tiles/experience_white_black_full.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompanySearchCompanyScreen extends StatefulWidget {
  const CompanySearchCompanyScreen({super.key});

  @override
  State<CompanySearchCompanyScreen> createState() =>
      _CompanySearchCompanyScreenState();
}

class _CompanySearchCompanyScreenState
    extends State<CompanySearchCompanyScreen> {
  final int currentIndex =
      3; // Selected "Competitor" based on the image highlighting? Actually, in image "Competitor" is highlighted.

  final navItems = [
    {
      'icon': 'lib/Resources/Icons/Home.svg',
      'label': '',
    }, // actually in snapshot no label for non-selected
    {'icon': 'lib/Resources/Icons/Post.svg', 'label': ''},
    {'icon': 'lib/Resources/Icons/User.svg', 'label': ''}, // Looks like search?
    {'icon': 'lib/Resources/Icons/Competitor.svg', 'label': 'Competitor'},
    {'icon': 'lib/Resources/Icons/Profile.svg', 'label': ''},
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F9), // Light background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              // Header
              const Row(
                children: [
                  Icon(
                    Icons.groups_outlined,
                    size: 24,
                    color: Color(0xFF1C1C3A),
                  ),
                  SizedBox(width: 8),
                  CustomText(
                    text: "Explore Companies",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1C1C3A),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // Search Bar
              CustomSearchBar(
                hintText: "TechNova Inc.",
                backgroundColor: Colors.white,
                width: screenWidth,
                iconTextSpacing: 10,
                iconColor: const Color(0xFF1C1C3A),
                height: 55,
              ),
              const SizedBox(height: 25),

              // List of Companies
              Container(
                height: 105,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Left Section
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                // MS Avatar
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF333333),
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment.center,
                                  child: const CustomText(
                                    text: "MS",
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                // Text info
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CustomText(
                                        text: "TechNova Inc.",
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1C1C3A),
                                      ),
                                      const SizedBox(height: 2),
                                      CustomText(
                                        text: "FinTech",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey.shade600,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            // Location pill
                            Container(
                              height: 24,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF1F1F1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: CustomText(
                                text: "New York, USA",
                                fontSize: 10,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Right Dark Section
                    Container(
                      width: 75,
                      decoration: const BoxDecoration(
                        color: Color(0xFF232323),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1.5),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_outward,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: ElevateColor.gray, width: 0.5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: List.generate(navItems.length, (i) {
              final item = navItems[i];
              bool selected = currentIndex == i;
              return Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedScale(
                      scale: selected ? 1.2 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      child: SvgPicture.asset(
                        item['icon'] as String,
                        height: 22,
                        colorFilter: ColorFilter.mode(
                          selected ? Colors.black : Colors.grey.shade400,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    if (selected) ...[
                      const SizedBox(height: 4),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: CustomText(
                          text: item['label'] as String,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
