import 'package:elevate_app/Custom_Widgets/Header/elevate_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdminDeleteJob extends StatelessWidget {
  const AdminDeleteJob({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Column(
          children: [
            ElevateHeader(
              title: "Deleting",
              subTitle: "Opportunity",
              titleSize: 40,
              subtitleSize: 18,
            ),
          ],
        )
      ),
    );
  }
}