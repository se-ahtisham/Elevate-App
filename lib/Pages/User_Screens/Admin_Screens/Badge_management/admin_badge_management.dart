import 'package:elevate_app/Custom_Widgets/Header/elevate_header.dart';
import 'package:elevate_app/Custom_Widgets/Search_Bar/custom_search_bar.dart';
import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:elevate_app/Custom_Widgets/Tiles/admin_badge_create_card.dart';
import 'package:elevate_app/Custom_Widgets/Tiles/admin_badge_result_card.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdminBadgeManagement extends StatefulWidget {
  const AdminBadgeManagement({super.key});

  @override
  State<AdminBadgeManagement> createState() => _AdminBadgeManagementState();
}

class _AdminBadgeManagementState extends State<AdminBadgeManagement> {
  final TextEditingController searchController =
      TextEditingController(text: "10110");

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 40;

    return Scaffold(
      backgroundColor: ElevateColor.white,
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final headerHeight = constraints.maxHeight.clamp(150.0, 205.0);
                  return ElevateHeader(
                    title: "Elevate\nBadges",
                    subTitle: "",
                    titleSize: 28,
                    subtitleSize: 1,
                  );
                },
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                color: const Color(0xFFF4F4F4),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 90),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AdminBadgeCreateCard(
                        code: "110011",
                        onCreate: () {},
                      ),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          Icon(
                            Icons.emoji_events_outlined,
                            size: 16,
                            color: ElevateColor.gray,
                          ),
                          const SizedBox(width: 8),
                          CustomText(
                            text: "Explore Badge",
                            fontSize: 12,
                            color: ElevateColor.gray,
                            fontWeight: FontWeight.w600,
                            lineHeight: 1.0,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomSearchBar(
                        hintText: "",
                        controller: searchController,
                        iconData: Icons.search_rounded,
                        iconSize: 18,
                        iconColor: ElevateColor.gray,
                        iconTextSpacing: 8,
                        backgroundColor: ElevateColor.white,
                        borderRadius: 28,
                        height: 34,
                        width: width,
                        textSize: 12,
                        onTap: () {},
                      ),
                      const SizedBox(height: 12),
                      AdminBadgeResultCard(
                        badgeCode: "10110",
                      badgeImagePath:
                          'lib/Resources/Images/Coding_Badges/Pure/pure_medium.png',
                        onManage: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const _BadgeBottomNav(),
    );
  }
}

class _BadgeBottomNav extends StatelessWidget {
  const _BadgeBottomNav();

  @override
  Widget build(BuildContext context) {
    const active = Color(0xFFB155FF);
    final bottomInset = MediaQuery.of(context).padding.bottom;

    Widget item({
      required IconData icon,
      required String label,
      required bool isActive,
    }) {
      return Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isActive)
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                width: 48,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(6),
                ),
              )
            else
              const SizedBox(height: 12),
            Icon(
              icon,
              size: 19,
              color: isActive ? active : ElevateColor.gray,
            ),
            const SizedBox(height: 3),
            if (label.isNotEmpty)
              CustomText(
                text: label,
                fontSize: 11,
                color: isActive ? active : ElevateColor.gray,
                fontWeight: FontWeight.w700,
                lineHeight: 1.0,
              ),
            if (label.isEmpty) const SizedBox(height: 14),
          ],
        ),
      );
    }

    return Container(
      height: 74 + bottomInset,
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Container(
        height: 74,
        decoration: const BoxDecoration(
          color: ElevateColor.white,
        ),
        child: Row(
          children: [
            item(
              icon: Icons.emoji_events_outlined,
              label: "",
              isActive: false,
            ),
            item(
              icon: Icons.edit_note_outlined,
              label: "Manage",
              isActive: true,
            ),
            item(
              icon: Icons.person_outline_rounded,
              label: "",
              isActive: false,
            ),
          ],
        ),
      ),
    );
  }
}

