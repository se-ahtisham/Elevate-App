import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:elevate_app/Resources/Colors/Gradient_Colors/gradient_colors.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';

/*
StatelessWidget: ElevateHeader
└── Stack
    ├── Container (Background Gradient)
    ├── Padding (Large Logo Position)
    │   └── Image.asset (Elevate_Large_Logo)
    └── Padding (Content Column)
        └── Column (crossAxisAlignment: start)
            ├── Image.asset (Elevate_Logo)
            ├── SizedBox (height: 50)
            ├── CustomText (title)
            └── CustomText (subTitle)


 */
class ElevateHeader extends StatelessWidget {
  final String title;
  final double titleSize;
  final double subtitleSize;
  final String subTitle;
  final double? height;
  final int titleMaxLines;
  final int subtitleMaxLines;

  const ElevateHeader({
    super.key,
    this.title = "",
    this.subTitle = "",
    this.titleSize = 27,
    this.subtitleSize = 14,
    this.height,
    this.titleMaxLines = 2,
    this.subtitleMaxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    const baseHeight = 250.0;
    final resolvedHeight = height ?? 270.0;
    final scale = resolvedHeight / baseHeight;
    final contentVerticalPadding = (75 * scale).clamp(40.0, 80.0);
    final largeLogoTop = (60 * scale).clamp(40.0, 90.0);

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: resolvedHeight,
          decoration: BoxDecoration(
            gradient: ElevateGradientColors.grayToBlack,
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: 20, top: largeLogoTop),
          child: Image.asset(
            'lib/Resources/Images/Elevate_Large_Logo.png',
            width: 410,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: contentVerticalPadding,
            horizontal: 30,
          ),
          child: SizedBox(
            height: resolvedHeight - (contentVerticalPadding * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('lib/Resources/Images/Elevate_Logo.png', width: 100),
                const SizedBox(height: 8),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: title,
                          fontSize: titleSize,
                          color: ElevateColor.white,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          lineHeight: 1.2,
                          maxLines: titleMaxLines,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        CustomText(
                          text: subTitle,
                          fontSize: subtitleSize,
                          color: ElevateColor.white,
                          fontWeight: FontWeight.w300,
                          textAlign: TextAlign.left,
                          lineHeight: 1.1,
                          maxLines: subtitleMaxLines,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
