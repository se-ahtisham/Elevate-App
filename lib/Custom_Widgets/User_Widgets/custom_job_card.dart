import 'package:elevate_app/Resources/Colors/Gradient_Colors/gradient_colors.dart';
import 'package:flutter/material.dart';

class CustomJobCard extends StatelessWidget {
  final String initials;
  final String title;
  final String companyAndLocation;
  final List<String> tags;
  final VoidCallback? onTap;

  const CustomJobCard({
    super.key,
    required this.initials,
    required this.title,
    required this.companyAndLocation,
    required this.tags,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(7),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ── Avatar ────────────────────────────────────────────────────────
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                gradient: ElevateGradientColors.grayToBlack,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                initials,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  letterSpacing: 0.5,
                ),
              ),
            ),

            const SizedBox(width: 14),

            // ── Center content ────────────────────────────────────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 15.5,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.2,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 3),

                  // Company · Location
                  Text(
                    companyAndLocation,
                    style: const TextStyle(
                      color: Color(0xFF999999),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.1,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Tag pills
                  Row(
                    children: tags
                        .asMap()
                        .entries
                        .map(
                          (e) => Padding(
                            padding: EdgeInsets.only(
                              right: e.key < tags.length - 1 ? 6 : 0,
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8E8E8),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Text(
                                e.value,
                                style: const TextStyle(
                                  color: Color(0xFF444444),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.1,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            // ── Arrow button ──────────────────────────────────────────────────
            InkWell(
              child: Container(
                width: 55,
                height: 80,
                decoration: BoxDecoration(
                  gradient: ElevateGradientColors.grayToBlack,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.arrow_outward_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
