import 'package:flutter/material.dart';
import 'screens/category_screen.dart';
import 'blocs/menu/menu_provider.dart';
import 'screens/login_screen.dart';
import 'widgets/menu/main_menu_scaffold.dart';
import 'blocs/login/login_provider.dart';
import 'data/constants.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: CategoryScreen(title: "SHOES",linkImage: "assets/imgs/landing_bg3.png", ),
      // home: MenuProvider(child:MainMenuScaffold()),
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
