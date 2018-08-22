import 'package:flutter/material.dart';
import '../data/constants.dart';
// import './screens/welcome_screen.dart';
import './screens/login_screen.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      theme: ThemeData(
        iconTheme: IconThemeData(color: AppColors.primary),
        backgroundColor: AppColors.background,
        fontFamily: 'Avenir',
        primaryColor: AppColors.primary,
      ),
    );
  }
}
