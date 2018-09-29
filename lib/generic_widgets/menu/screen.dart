import 'package:flutter/material.dart';

class BluredMenuScreen extends StatelessWidget {
  @required
  final String title;
  @required
  final Widget body;

  BluredMenuScreen({this.title, this.body});

  Widget build(BuildContext context) {
    return Material(
      child: body,
    );
  }
}