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
  final int? titleMaxLines;
  final int? subtitleMaxLines;
  final double titleLineHeight;
  final double subtitleLineHeight;

  const ElevateHeader({
    super.key,
    this.title = "",
    this.subTitle = "",
    this.titleSize = 27,
    this.subtitleSize = 14,
    this.height,
    this.titleMaxLines,
    this.subtitleMaxLines,
    this.titleLineHeight = 1.6,
    this.subtitleLineHeight = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedHeight = height ?? 250;
    final scale = resolvedHeight / 250.0;
    final resolvedTitleMaxLines = titleMaxLines ?? 2;
    final resolvedSubtitleMaxLines = subtitleMaxLines ?? 1;
    final hasSubtitle = subTitle.trim().isNotEmpty;
    final hasTitle = title.trim().isNotEmpty;

    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          width: double.infinity,
          height: resolvedHeight,
          decoration: BoxDecoration(
            gradient: ElevateGradientColors.grayToBlack,
          ),
        ),

        Positioned(
          left: 20,
          top: 60 * scale,
          child: Image.asset(
            'lib/Resources/Images/Elevate_Large_Logo.png',
            width: (410 * scale).clamp(180.0, 410.0),
          ),
        ),

        Positioned(
          left: 30,
          right: 30,
          bottom: 18 * scale,
          child: FittedBox(
            alignment: Alignment.bottomLeft,
            fit: BoxFit.scaleDown,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'lib/Resources/Images/Elevate_Logo.png',
                  width: (100 * scale).clamp(60.0, 100.0),
                ),
                SizedBox(height: 12 * scale),
                if (hasTitle)
                  CustomText(
                    text: title,
                    fontSize: titleSize,
                    color: ElevateColor.white,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                    lineHeight: titleLineHeight,
                    maxLines: resolvedTitleMaxLines,
                    overflow: TextOverflow.ellipsis,
                  ),
                if (hasSubtitle) ...[
                  SizedBox(height: 6 * scale),
                  CustomText(
                    text: subTitle,
                    fontSize: subtitleSize,
                    color: ElevateColor.white,
                    fontWeight: FontWeight.w300,
                    textAlign: TextAlign.left,
                    lineHeight: subtitleLineHeight,
                    maxLines: resolvedSubtitleMaxLines,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
