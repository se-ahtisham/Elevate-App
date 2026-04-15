import 'package:elevate_app/Custom_Widgets/Buttons/text_button_gradient.dart';
import 'package:elevate_app/Custom_Widgets/Header/elevate_header.dart';
import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpdateBadgeScreen extends StatelessWidget {
  const UpdateBadgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  return Stack(
                    children: [
                      ElevateHeader(
                        title: "Elevate\nBadges",
                        subTitle: "",
                        titleSize: 28,
                        subtitleSize: 1,

                      ),
                      const Positioned(
                        top: 8,
                        left: 18,
                        child: SafeArea(
                          bottom: false,
                          child: CustomText(
                            text: "Elevate",
                            fontSize: 22,
                            color: ElevateColor.white,
                            fontWeight: FontWeight.w700,
                            lineHeight: 1.0,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                width: double.infinity,
                color: const Color(0xFFF4F4F4),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(22, 8, 22, 90),
                  child: Column(
                    children: [
                      const SizedBox(height: 4),
                      const CustomText(
                        text: "OLD BADGE IMAGE",
                        fontSize: 20,
                        color: ElevateColor.gray,
                        fontWeight: FontWeight.w400,
                        lineHeight: 1.0,
                      ),
                      const SizedBox(height: 16),
                      Image.asset(
                        'lib/Resources/Images/Coding_Badges/Pure/pure_medium.png',
                        width: 92,
                        height: 92,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 18),
                      const CustomText(
                        text: "NEW BADGE IMAGE",
                        fontSize: 20,
                        color: ElevateColor.gray,
                        fontWeight: FontWeight.w400,
                        lineHeight: 1.0,
                      ),
                      const SizedBox(height: 14),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          customBorder: const CircleBorder(),
                          child: Container(
                            width: 124,
                            height: 124,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF3F3F3),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFFE0E0E0),
                                width: 1.5,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x22000000),
                                  blurRadius: 12,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 60,
                              color: Color(0xFFB8B8B8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextButtonGradient(
                        text: "Update Badge",
                        width: double.infinity,
                        height: 38,
                        borderRadius: 11,
                        textSize: 13,
                        textWeight: FontWeight.w600,
                        onTap: () {},
                      ),
                      const SizedBox(height: 10),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 38),
                          side: const BorderSide(
                            color: Color(0xFF808080),
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                          backgroundColor: Colors.transparent,
                          foregroundColor: ElevateColor.gray,
                        ),
                        child: const CustomText(
                          text: "Cancel",
                          fontSize: 13,
                          color: ElevateColor.gray,
                          fontWeight: FontWeight.w500,
                          lineHeight: 1.0,
                        ),
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
