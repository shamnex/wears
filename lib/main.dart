import 'package:flutter/material.dart';
import 'data/constants.dart';
import 'pages/welcome/welcome_page.dart';

void main() {
  runApp(new MaterialApp(
      home: new WelcomePage(),
      theme: new ThemeData(
          backgroundColor: AppColors.background,
          fontFamily: 'Avenir',
          primaryColor: AppColors.primary)));
}
