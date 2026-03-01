import 'package:flutter/material.dart';
import 'package:elevate_app/Pages/portfolio/portfolio_description_screen.dart';

void main() {
  runApp(const ElevateApp());
}

class ElevateApp extends StatelessWidget {
  const ElevateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PortfolioDescriptionScreen(),
    );
  }
}
