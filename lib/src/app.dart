import 'package:flutter/material.dart';
import 'blocs/menu_provider.dart';
// import 'package:wears/src/screens/login_screen.dart';
import 'widgets/menu/main_menu_scaffold.dart';
// import 'blocs/login_provider.dart';
import 'data/constants.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuProvider(child:MainMenuScaffold()),
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
