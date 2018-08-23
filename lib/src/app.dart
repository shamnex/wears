import 'package:flutter/material.dart';
// import 'blocs/login_provider.dart';
import 'data/constants.dart';
// import './screens/welcome_screen.dart';
// import './screens/login_screen.dart';
import './screens/home_screen.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      // home: LoginProvider(child:LoginScreen()),
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: AppColors.background,
        fontFamily: 'Avenir',
        primaryColor: AppColors.primary,
      ),
    );
  }
}
