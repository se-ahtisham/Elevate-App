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
  final double titleLineHeight;
  final double subtitleLineHeight;
  final String subTitle;
  final double? height;
  final int? titleMaxLines;
  final int? subtitleMaxLines;

  const ElevateHeader({
    super.key,
    this.title = "",
    this.subTitle = "",
    this.titleSize = 27,
    this.subtitleSize = 14,
    this.titleLineHeight = 1.6,
    this.subtitleLineHeight = 1.0,
    this.height,
    this.titleMaxLines,
    this.subtitleMaxLines,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedHeight = height ?? 250;
    final scale = resolvedHeight / 250;

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

        Padding(
          padding: EdgeInsets.only(left: 20, top: 60 * scale),
          child: Image.asset(
            'lib/Resources/Images/Elevate_Large_Logo.png',
            width: 410,
          ),
        ),
        Positioned(
          left: 30,
          top: 75 * scale,
          child: Image.asset('lib/Resources/Images/Elevate_Logo.png', width: 100),
        ),
        Positioned(
          left: 30,
          right: 30,
          bottom: 28 * scale,
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
                lineHeight: titleLineHeight,
                maxLines: titleMaxLines,
                overflow: titleMaxLines != null
                    ? TextOverflow.ellipsis
                    : TextOverflow.visible,
              ),
              if (subTitle.isNotEmpty)
                CustomText(
                  text: subTitle,
                  fontSize: subtitleSize,
                  color: ElevateColor.white,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.left,
                  lineHeight: subtitleLineHeight,
                  maxLines: subtitleMaxLines,
                  overflow: subtitleMaxLines != null
                      ? TextOverflow.ellipsis
                      : TextOverflow.visible,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
