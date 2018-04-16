import 'package:flutter/material.dart';

class GradientOverlay extends StatelessWidget {

  final List<Color> gradientColors;

  GradientOverlay(this.gradientColors);

  @override
  Widget build(BuildContext context) {
    return new DecoratedBox(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: const Alignment(0.0, 0.0),
              end: const Alignment(0.0, 1.0),
              colors: gradientColors
            ),
          ),
        );
  }
}