import 'package:flutter/material.dart';

import 'package:elevate_app/Custom_Widgets/Buttons/circle_icon_button.dart';
import 'package:elevate_app/Custom_Widgets/Buttons/text_button.dart';
import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:elevate_app/Custom_Widgets/custom_gradient.dart';

import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';

class PortfolioDescriptionScreen extends StatelessWidget {
  const PortfolioDescriptionScreen({super.key});

  static const List<String> previewImages = [
    "lib/Resources/Images/mock.png",
    "lib/Resources/Images/mock2.png",
    "lib/Resources/Images/mock.png",
    "lib/Resources/Images/mock2.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElevateColor.white,
      extendBody: true,
      body: Stack(
        children: [
          // Header gradient (dark)
          SizedBox(
            height: 240,
            width: double.infinity,
            child: CustomGradient(
              colors: const [Color(0xFF4A4A4A), Color(0xFF101010)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // Top bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      CircleIconButton(
                        iconData: Icons.arrow_back_ios_new_rounded,
                        circleSize: 38,
                        iconSize: 18,
                        circleColor: ElevateColor.white.withOpacity(0.20),
                        iconColor: ElevateColor.white,
                        rippleColor: ElevateColor.white.withOpacity(0.25),
                        onTap: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 10),
                      const CustomText(
                        text: "Elevate",
                        fontSize: 22,
                        color: ElevateColor.white,
                        fontWeight: FontWeight.w600,
                        lineHeight: 1.2,
                      ),
                      const Spacer(),

                      // UPDATE PROJECT BUTTON
                      CustomTextButton(
                        text: "UPDATE PROJECT",
                        textSize: 11,
                        textColor: ElevateColor.white,
                        textWeight: FontWeight.w700,
                        lineHeight: 1.0,
                        backgroundColor: Colors.transparent,
                        borderColor: ElevateColor.white.withOpacity(0.70),
                        borderWidth: 1,
                        borderRadius: 40,
                        paddingLeft: 14,
                        paddingRight: 14,
                        paddingTop: 9,
                        paddingBottom: 9,
                        rippleColor: ElevateColor.white.withOpacity(0.18),
                        onTap: () {
                          // TODO
                        },
                      ),
                    ],
                  ),
                ),

                // Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 110),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),

                        // Floating title card
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 22,
                            ),
                            decoration: BoxDecoration(
                              color: ElevateColor.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 18,
                                  color: Colors.black.withOpacity(0.12),
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: const Column(
                              children: [
                                CustomText(
                                  text: "E-Commerce\nMobile Application",
                                  textAlign: TextAlign.center,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                  color: ElevateColor.lightgray,
                                  lineHeight: 1.15,
                                ),
                                SizedBox(height: 10),
                                CustomText(
                                  text: "Lead Developer",
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w500,
                                  color: ElevateColor.whitegray,
                                  lineHeight: 1.2,
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 22),

                        // White content container
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(18, 14, 18, 20),
                          decoration: BoxDecoration(
                            color: ElevateColor.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),

                              const CustomText(
                                text: "My Creation",
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: ElevateColor.lightgray,
                                lineHeight: 1.2,
                              ),
                              const SizedBox(height: 12),

                              SizedBox(
                                height: 92,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: previewImages.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(width: 14),
                                  itemBuilder: (context, i) {
                                    return _PreviewCard(
                                      imagePath: previewImages[i],
                                      heroTag: "preview_$i", // unique hero tag
                                    );
                                  },
                                ),
                              ),

                              const SizedBox(height: 20),

                              const CustomText(
                                text: "Description",
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: ElevateColor.lightgray,
                                lineHeight: 1.2,
                              ),
                              const SizedBox(height: 10),
                              const CustomText(
                                text:
                                    "We are seeking a talented UI/UX Designer to join "
                                    "our team and craft engaging, user-friendly digital "
                                    "experiences. You will be responsible for designing",
                                fontSize: 13.5,
                                fontWeight: FontWeight.w400,
                                color: ElevateColor.whitegray,
                                lineHeight: 1.45,
                              ),

                              const SizedBox(height: 18),

                              const CustomText(
                                text: "Files",
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: ElevateColor.lightgray,
                                lineHeight: 1.2,
                              ),
                              const SizedBox(height: 12),

                              _FilePill(
                                fileName: "index.html",
                                onDownload: () {},
                              ),
                              const SizedBox(height: 12),
                              _FilePill(
                                fileName: "java.zip",
                                onDownload: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // Bottom nav
      bottomNavigationBar: const _BottomNavBar(activeIndex: 3),
    );
  }
}

//  Preview Card (TAP -> FULL SCREEN)

class _PreviewCard extends StatelessWidget {
  final String imagePath;
  final String heroTag;

  const _PreviewCard({required this.imagePath, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                _FullScreenImage(imagePath: imagePath, heroTag: heroTag),
          ),
        );
      },
      child: Container(
        width: 156,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ElevateColor.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 14,
              color: Colors.black.withOpacity(0.08),
              offset: const Offset(0, 8),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Hero(
          tag: heroTag,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              color: const Color(0xFFF2F2F2),
              alignment: Alignment.center,
              child: const Icon(
                Icons.image_outlined,
                size: 28,
                color: Color(0xFF9B9B9B),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FullScreenImage extends StatelessWidget {
  final String imagePath;
  final String heroTag;

  const _FullScreenImage({required this.imagePath, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElevateColor.black,
      body: Stack(
        children: [
          Center(
            child: Hero(
              tag: heroTag,
              child: InteractiveViewer(
                minScale: 0.8,
                maxScale: 4.0,
                child: Image.asset(imagePath),
              ),
            ),
          ),

          Positioned(
            top: 50,
            left: 20,
            child: CircleIconButton(
              iconData: Icons.arrow_back,
              circleSize: 40,
              iconSize: 20,
              circleColor: ElevateColor.white.withOpacity(0.20),
              iconColor: ElevateColor.white,
              rippleColor: ElevateColor.white.withOpacity(0.30),
              onTap: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}

//  Files Pill container with download button

class _FilePill extends StatelessWidget {
  final String fileName;
  final VoidCallback onDownload;

  const _FilePill({required this.fileName, required this.onDownload});

  @override
  Widget build(BuildContext context) {
    const border = Color(0xFFE0E0E0);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: ElevateColor.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: border, width: 1),
      ),
      child: Row(
        children: [
          const SizedBox(width: 4),
          CustomText(
            text: fileName,
            fontSize: 13.5,
            fontWeight: FontWeight.w600,
            color: ElevateColor.lightgray,
            lineHeight: 1.2,
          ),
          const Spacer(),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onDownload,
            child: const Padding(
              padding: EdgeInsets.all(6.0),
              child: Icon(
                Icons.download_rounded,
                size: 20,
                color: ElevateColor.lightgray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//  Bottom Nav

class _BottomNavBar extends StatelessWidget {
  final int activeIndex;
  const _BottomNavBar({required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFFB155FF);

    Widget item({required int index, required IconData icon, String? label}) {
      final isActive = index == activeIndex;

      return Expanded(
        child: InkWell(
          onTap: () {
            // TODO
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: isActive ? accent : ElevateColor.gray,
                ),
                const SizedBox(height: 6),
                if (label != null)
                  CustomText(
                    text: label,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: isActive ? accent : Colors.transparent,
                    lineHeight: 1.0,
                  )
                else
                  const SizedBox(height: 14),
              ],
            ),
          ),
        ),
      );
    }

    return SafeArea(
      top: false,
      child: Container(
        height: 84,
        decoration: BoxDecoration(
          color: ElevateColor.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 18,
              color: Colors.black.withOpacity(0.08),
              offset: const Offset(0, -8),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(22),
            topRight: Radius.circular(22),
          ),
        ),
        child: Row(
          children: [
            item(index: 0, icon: Icons.work_outline_rounded),
            item(index: 1, icon: Icons.pie_chart_outline_rounded),
            item(index: 2, icon: Icons.send_outlined),
            item(index: 3, icon: Icons.folder_open_rounded, label: "Portfolio"),
            item(index: 4, icon: Icons.person_outline_rounded),
          ],
        ),
      ),
    );
  }
}
