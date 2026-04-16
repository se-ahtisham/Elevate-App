import 'package:elevate_app/Custom_Widgets/Header/elevate_header.dart';
import 'package:elevate_app/Custom_Widgets/Search_Bar/custom_search_bar.dart';
import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:elevate_app/Custom_Widgets/Text_background_box/custom_text_box.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllTrendingSkillsScreen extends StatefulWidget {
  const AllTrendingSkillsScreen({super.key});

  @override
  State<AllTrendingSkillsScreen> createState() =>
      _AllTrendingSkillsScreenState();
}

class _AllTrendingSkillsScreenState extends State<AllTrendingSkillsScreen> {
  final TextEditingController _searchController = TextEditingController();

  final navItems = [
    {'icon': 'lib/Resources/Icons/Home.svg', 'label': 'Home'},
    {'icon': 'lib/Resources/Icons/Test.svg', 'label': 'Tests'},
    {'icon': 'lib/Resources/Icons/Network.svg', 'label': 'Network'},
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
              bool selected = 0 == i; // Home selected based on mockup

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const ElevateHeader(
              title: "Hot Skills Right Now",
              titleSize: 26,
              subTitle: "Practice the skills shaping the tech market",
              subtitleSize: 11.5,
              titleLineHeight: 1.3,
            ),

            // Content Body
            Transform.translate(
              offset: const Offset(0, -25),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 16.0,
                  top: 0.0,
                ),
                child: Column(
                  children: [
                    // Search Bar
                    CustomSearchBar(
                      controller: _searchController,
                      hintText: 'Search Skill',
                      iconData: Icons.search,
                      backgroundColor: Colors.white,
                      height: 48,
                      width: double.infinity,
                      iconColor: const Color(0xFF4A4A7A),
                    ),

                    const SizedBox(height: 16),

                    // List of Skills
                    _buildSkillCard(),
                    const SizedBox(height: 16),
                    _buildSkillCard(),
                    const SizedBox(height: 16),
                    _buildSkillCard(),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Composed using standard Widgets + CustomText/CustomTextBox
  // since this exact clean white aesthetic card doesn't exist in Custom_Widgets/Tiles yet.
  Widget _buildSkillCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10), // Soft drop shadow
            blurRadius: 24,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Avatar
              Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  color: Color(0xFF434343),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const CustomText(
                  text: "MS",
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 14),

              // Title and Subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: "UI/UX Designer",
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF222222),
                  ),
                  const SizedBox(height: 4),
                  const CustomText(
                    text: "Microsoft • USA",
                    fontSize: 11.5,
                    color: Color(0xFF888888),
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Salary Tag Banner
          CustomTextBox(
            width: double.infinity,
            height: 32,
            text: "\$600 - 800 yearly",
            textSize: 11,
            textColor: const Color(0xFF7A7A7A),
            backgroundColor: const Color(0xFFF3F3F3),
            borderRadius: 30,
            paddingTop: 0,
            paddingBottom: 0,
          ),
        ],
      ),
    );
  }
}
