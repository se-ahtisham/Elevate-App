import 'package:elevate_app/Custom_Widgets/Buttons/circle_icon_button.dart';
import 'package:elevate_app/Custom_Widgets/Search_Bar/custom_search_bar.dart';
import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:elevate_app/Custom_Widgets/Tiles/featured_job_card.dart';
import 'package:elevate_app/Custom_Widgets/Tiles/job_compact_tile.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _topHeader(context),
                const SizedBox(height: 16),

                const CustomSearchBar(
                  hintText: 'Search Company',
                  width: double.infinity,
                  height: 50,
                  textSize: 14,
                  iconSize: 22,
                  iconColor: Color(0xFF505050),
                  backgroundColor: Color(0xFFF1F1F1),
                  borderRadius: 18,
                ),

                const SizedBox(height: 14),

                const CustomText(
                  text: 'Recommended Jobs',
                  fontSize: 18,
                  color: ElevateColor.gray,
                  fontWeight: FontWeight.w700,
                  lineHeight: 1.2,
                ),

                const SizedBox(height: 10),

                FeaturedJobCard(
                  initials: 'MS',
                  title: 'SOFTWARE ENGINEER',
                  companyAndLocation: 'Microsoft  •  USA',
                  description:
                      'Strong skills in programming, debugging, and building efficient software solutions.',
                  onApplyTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Apply button clicked')),
                    );
                  },
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    const Expanded(
                      child: CustomText(
                        text: 'OTHER JOBS FOR YOU',
                        fontSize: 16,
                        color: ElevateColor.gray,
                        fontWeight: FontWeight.w700,
                        lineHeight: 1.1,
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('More jobs clicked')),
                        );
                      },
                      child: Ink(
                        height: 34,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF595959), Color(0xFF111111)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: const Center(
                          child: CustomText(
                            text: 'MORE JOBS',
                            fontSize: 10,
                            color: ElevateColor.white,
                            fontWeight: FontWeight.w600,
                            lineHeight: 1.1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                JobCompactTile(
                  initials: 'MS',
                  title: 'UI/UX Designer',
                  company: 'Microsoft',
                  location: 'USA',
                  tags: const ['Remote', 'Full Time', '600/month'],
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Open job details')),
                    );
                  },
                ),

                const SizedBox(height: 10),

                JobCompactTile(
                  initials: 'MS',
                  title: 'UI/UX Designer',
                  company: 'Microsoft',
                  location: 'USA',
                  tags: const ['Remote', 'Full Time', '600/month'],
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Open job details')),
                    );
                  },
                ),

                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _topHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: const BoxDecoration(
              color: Color(0xFFE8E8E8),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const CustomText(
              text: 'A',
              fontSize: 36,
              color: ElevateColor.gray,
              fontWeight: FontWeight.w700,
              lineHeight: 1.0,
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Let's Work,",
                  fontSize: 13,
                  color: Color(0xFF9A9A9A),
                  fontWeight: FontWeight.w500,
                  lineHeight: 1.1,
                ),
                CustomText(
                  text: 'Ahtisham Arshad',
                  fontSize: 23,
                  color: ElevateColor.gray,
                  fontWeight: FontWeight.w700,
                  lineHeight: 1.1,
                ),
              ],
            ),
          ),
          CircleIconButton(
            iconData: Icons.inventory_2_outlined,
            iconSize: 20,
            iconColor: ElevateColor.gray,
            circleSize: 44,
            circleColor: ElevateColor.white,
            borderColor: const Color(0xFFE5E5E5),
            borderWidth: 1,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Header action clicked')),
              );
            },
            rippleColor: const Color(0x11000000),
          ),
        ],
      ),
    );
  }
}