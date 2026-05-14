import 'package:flutter/material.dart';

// Animation for screen from down to up

class SlideUpRoute extends PageRouteBuilder {
  SlideUpRoute({required Widget page})
      : super(
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (_, _, _) => page,
          transitionsBuilder: (_, animation, _, child) {
            return SlideTransition(
              position: Tween(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}