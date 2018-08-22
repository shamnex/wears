import 'package:flutter/material.dart';

class GradientOverlay extends StatelessWidget {
  final List<Color> colors;

  GradientOverlay({this.colors});

  @override
  Widget build(BuildContext context) {
    return new DecoratedBox(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            begin: const Alignment(0.0, -1.0),
            end: const Alignment(0.0, 1.0),
            colors: colors),
      ),
    );
  }
}
