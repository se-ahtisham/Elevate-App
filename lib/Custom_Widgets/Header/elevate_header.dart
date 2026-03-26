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

  const ElevateHeader({super.key, this.title = "", this.subTitle = "", this.titleSize = 27, this.subtitleSize = 14});

  @override
  Widget build(BuildContext context) {
    const double headerHeight = 250;

    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          width: double.infinity,
          height: headerHeight,
          decoration: BoxDecoration(
            gradient: ElevateGradientColors.grayToBlack,
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: 20, top: 60),
          child: Image.asset(
            'lib/Resources/Images/Elevate_Large_Logo.png',
            width: 410,
          ),
        ),
        Positioned(
          left: 30,
          top: 65,
          child: Image.asset('lib/Resources/Images/Elevate_Logo.png', width: 100),
        ),
        Positioned(
          left: 30,
          right: 30,
          bottom: 18,
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
                lineHeight: 1.15,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (subTitle.isNotEmpty)
                CustomText(
                  text: subTitle,
                  fontSize: subtitleSize,
                  color: ElevateColor.white,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.left,
                  lineHeight: 1.0,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
