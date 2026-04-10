import 'package:elevate_app/Custom_Widgets/Header/elevate_header.dart';
import 'package:elevate_app/Custom_Widgets/navBar_widget/bottom_navbar.dart';
import 'package:elevate_app/Custom_Widgets/portfolio_cart/portfolio_cart.dart';
import 'package:flutter/material.dart';

class PorfolioScreen extends StatefulWidget {
  const PorfolioScreen({super.key});

  @override
  State<PorfolioScreen> createState() => _PorfolioScreenState();
}

class _PorfolioScreenState extends State<PorfolioScreen> {
  int currentIndex = 3;
  final String title = "Professional profile";
  final String subtitle = "showcasing your proven technical skills";
  final List<Map<String, String>> projects = [
    {
      "name": "E-Commerce",
      "type": "Mobile Application",
      "role": "Lead Developer",
      "description": "A mobile platform for online shopping",
    },
    {
      "name": "Portfolio Website",
      "type": "Web Application",
      "role": "Frontend Developer",
      "description": "Showcasing professional skills and projects",
    },
    {
      "name": "Gaming",
      "type": "Web Application",
      "role": "game developer",
      "description": "Showcasing professional skills and projects",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  ElevateHeader();
      body: Column(
        children: [
          ElevateHeader(title: title, subTitle: subtitle),
          // ElevateHeader(title: title, subTitle: subtitle),
          Expanded(
            // flex: ,
            child: ListView.builder(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return PortfolioCard(
                  projectName: project["name"]!,
                  projectType: project["type"]!,
                  role: project["role"]!,
                  description: project["description"]!,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavbar(
        selectedIndex: currentIndex,
        onItemTapped: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
