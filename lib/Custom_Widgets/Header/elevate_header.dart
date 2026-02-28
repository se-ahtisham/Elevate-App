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
  final String subTitle;

  const ElevateHeader({super.key, this.title = "", this.subTitle = ""});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 260,
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('lib/Resources/Images/Elevate_Logo.png', width: 100),
              SizedBox(height: 50),
              CustomText(
                text: title,
                fontSize: 27,
                color: ElevateColor.white,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.left,
                lineHeight: 1.6,
              ),
              CustomText(
                text: subTitle,
                fontSize: 14,
                color: ElevateColor.white,
                fontWeight: FontWeight.w300,
                textAlign: TextAlign.left,
                lineHeight: 1.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
