import 'package:elevate_app/Custom_Widgets/Header/elevate_header.dart';
import 'package:elevate_app/Custom_Widgets/portfolio_cart/portfolio_cart.dart';
import 'package:flutter/material.dart';

class PorfolioScreen extends StatefulWidget {
  const PorfolioScreen({super.key});

  @override
  State<PorfolioScreen> createState() => _PorfolioScreenState();
}

class _PorfolioScreenState extends State<PorfolioScreen> {
  final String title = "Professional profile";
  final String subtitle = "showcasing your proven technical skills";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  ElevateHeader();
      body: Column(
        children: [
          ElevateHeader(title: title, subTitle: subtitle),

          PortfolioCard(
            projectName: "tictactoe",
            projectType: "mobile application",
            role: 'lead ',
            description: "manager",
          ),
        ],
      ),
    );
  }
}
