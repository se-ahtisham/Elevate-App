import 'package:elevate_app/Custom_Widgets/Buttons/text_button_gradient.dart';
import 'package:elevate_app/Custom_Widgets/Buttons/texxt_button.dart';
import 'package:elevate_app/Custom_Widgets/Header/elevate_header.dart';
import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:elevate_app/Custom_Widgets/Tiles/company_tile.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JobSelection extends StatelessWidget {
  final String imageURL;
  final String name;
  final String shortDescription;
  final String description;

  const JobSelection({
    super.key,
    required this.imageURL,
    required this.name,
    this.shortDescription = "",
    this.description = "",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElevateColor.white,
      extendBodyBehindAppBar: true,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ElevateHeader(),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(top: 150.0, left: 80),
                  child: CompanyTile(
                    imageURL: imageURL,

                    name: name,
                    shortDescription: shortDescription,
                    tileHeight: 180,
                    tileWidth: 250,
                    imageSize: 100,
                    spacingBetweenImageAndText: 12,
                    nameFontSize: 16,
                    nameColor: Colors.black,
                    nameFontWeight: FontWeight.bold,
                    nameLineHeight: 1.2,
                    descriptionFontSize: 12,
                    descriptionColor: Colors.grey,
                    descriptionFontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  CustomText(
                    text: "Description",
                    fontSize: 19,
                    color: const Color.fromARGB(255, 99, 99, 99),
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    lineHeight: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 15),
                  CustomText(
                    text: description,
                    fontSize: 12,
                    color: const Color.fromARGB(255, 99, 99, 99),
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.justify,
                    lineHeight: 1.5,
                  ),
                  SizedBox(height: 40),
                  TexxtButton(
                    text: "Quick Mail",
                    height: 50,
                    textSize: 14,
                    textColor: ElevateColor.gray,
                    textWeight: FontWeight.w400,
                    borderRadius: 50,
                    backgroundColor: Colors.transparent,
                    borderColor: ElevateColor.gray,
                    borderWidth: 1,
                    onTap: null,
                  ),
                  SizedBox(height: 15),
                  TextButtonGradient(
                    text: "Apply Now",
                    height: 50,
                    textSize: 14,
                    textWeight: FontWeight.w400,
                    borderRadius: 50,
                    onTap: null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
