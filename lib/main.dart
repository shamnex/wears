import 'package:flutter/material.dart';
import 'data/constants.dart';
import 'pages/welcome/welcome_page.dart';

void main() {
  runApp( MaterialApp(
      home:  WelcomePage(),
      theme:  ThemeData(
          backgroundColor: AppColors.background,
          fontFamily: 'Avenir',
          primaryColor: AppColors.primary)));
}
