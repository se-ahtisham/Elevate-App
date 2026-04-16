import 'package:elevate_app/Custom_Widgets/Search_Bar/custom_search_bar.dart';
import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:elevate_app/Custom_Widgets/Text_background_box/custom_text_box.dart';
import 'package:elevate_app/Custom_Widgets/Buttons/circle_icon_button.dart';
import 'package:elevate_app/Resources/Colors/Gradient_Colors/gradient_colors.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompanySearchUserScreen extends StatefulWidget {
  const CompanySearchUserScreen({super.key});

  @override
  State<CompanySearchUserScreen> createState() =>
      _CompanySearchUserScreenState();
}

class _CompanySearchUserScreenState extends State<CompanySearchUserScreen> {
  final TextEditingController _searchController = TextEditingController();

  final navItems = [
    {'icon': 'lib/Resources/Icons/Home.svg', 'label': 'Home'},
    {'icon': 'lib/Resources/Icons/Test.svg', 'label': 'Tests'},
    {'icon': 'lib/Resources/Icons/User.svg', 'label': 'Users'},
    {'icon': 'lib/Resources/Icons/Portfolio.svg', 'label': 'Portfolio'},
    {'icon': 'lib/Resources/Icons/Profile.svg', 'label': 'Profile'},
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: ElevateColor.gray),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(30),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: List.generate(navItems.length, (i) {
              final item = navItems[i];
              bool selected = 2 == i; // Users selected based on mockup

              return Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedScale(
                        scale: selected ? 1.3 : 1.0,
                        duration: const Duration(milliseconds: 200),
                        child: SvgPicture.asset(
                          item['icon'] as String,
                          height: 22,
                          colorFilter: ColorFilter.mode(
                            selected ? Colors.black : Colors.grey,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      if (selected) ...[
                        const SizedBox(height: 4),
                        CustomText(
                          text: item['label'] as String,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              // Header Row
              Row(
                children: [
                  Icon(Icons.groups_rounded, color: ElevateColor.gray, size: 28),
                  const SizedBox(width: 10),
                  const CustomText(
                    text: "Explore Profiles",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              
              // Search Bar
              CustomSearchBar(
                controller: _searchController,
                hintText: 'Muhammad Ahtisham',
                iconData: Icons.search,
                backgroundColor: Colors.white,
                height: 48,
                width: double.infinity,
                iconColor: const Color(0xFF4A4A7A),
              ),
              const SizedBox(height: 20),
              
              // Profiles List (Constructed with custom widgets matching ExperienceWhiteBlackFull's layout)
              _buildProfileCard(),
            ],
          ),
        ),
      ),
    );
  }

  // Built mimicking the exact structure of your ExperienceWhiteBlackFull tile, 
  // but explicitly supporting text-initial avatars to perfectly match the mockup.
  Widget _buildProfileCard() {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // White Content Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 14, top: 12, bottom: 12, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      // Avatar
                      Container(
                        width: 44,
                        height: 44,
                        decoration: const BoxDecoration(
                          color: Color(0xFF434343),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: const CustomText(
                          text: "MS",
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 12),
                      
                      // Name and Subtitle
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                              text: "Muhammad Ahtisham",
                              fontSize: 13.5,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF222222),
                            ),
                            const SizedBox(height: 2),
                            const CustomText(
                              text: "ui/ux designer",
                              fontSize: 10.5,
                              color: Color(0xFF888888),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Experience Banner
                  CustomTextBox(
                    width: double.infinity,
                    height: 26,
                    text: "3+ experience",
                    textSize: 10,
                    textColor: const Color(0xFF6A6A6A),
                    backgroundColor: const Color(0xFFF3F3F3),
                    borderRadius: 30,
                    paddingBottom: 0,
                    paddingTop: 0,
                  ),
                ],
              ),
            ),
          ),
          
          // Black Action Section
          Container(
            width: 80,
            decoration: BoxDecoration(
              gradient: ElevateGradientColors.grayToBlack,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Center(
              child: CircleIconButton(
                iconData: Icons.arrow_outward,
                iconSize: 18,
                iconColor: Colors.white,
                circleSize: 34,
                circleColor: Colors.transparent,
                borderWidth: 1.2,
                borderColor: Colors.white,
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
