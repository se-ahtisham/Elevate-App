import 'package:flutter/material.dart';

// Animation for screen from up to down

class SlideDownRoute extends PageRouteBuilder {
  SlideDownRoute({required Widget page})
      : super(
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (_, _, _) => page,
          transitionsBuilder: (_, animation, _, child) {
            return SlideTransition(
              position: Tween(
                begin: const Offset(0, -1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
