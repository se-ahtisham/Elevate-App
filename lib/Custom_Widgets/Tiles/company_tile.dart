import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';

class CompanyTile extends StatelessWidget {
  final String imageURL;
  final String name;
  final String shortDescription;

  final double tileHeight;
  final double tileWidth;
  final double imageSize;
  final double spacingBetweenImageAndText;

  final double nameFontSize;
  final Color nameColor;
  final FontWeight nameFontWeight;
  final double nameLineHeight;

  final double descriptionFontSize;
  final Color descriptionColor;
  final FontWeight descriptionFontWeight;

  const CompanyTile({
    super.key,
    required this.imageURL,
    required this.name,
    this.shortDescription = "",
    required this.tileHeight,
    required this.tileWidth,
    required this.imageSize,
    required this.spacingBetweenImageAndText,
    required this.nameFontSize,
    required this.nameColor,
    required this.nameFontWeight,
    required this.nameLineHeight,
    required this.descriptionFontSize,
    required this.descriptionColor,
    required this.descriptionFontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: tileHeight,
      width: tileWidth,
      decoration: BoxDecoration(
         color: ElevateColor.white,
         borderRadius: BorderRadius.circular(30),
         border: Border.all(color: ElevateColor.gray, width: 1)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imageURL),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: spacingBetweenImageAndText),
          CustomText(
            text: name,
            fontSize: nameFontSize,
            color: nameColor,
            fontWeight: nameFontWeight,
            textAlign: TextAlign.left,
            lineHeight: nameLineHeight,
          ),
          CustomText(
            text: shortDescription,
            fontSize: descriptionFontSize,
            color: descriptionColor,
            fontWeight: descriptionFontWeight,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
