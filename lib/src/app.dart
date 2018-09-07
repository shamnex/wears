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
      // home: LoginProvider(child:LoginScreen()),
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: AppColors.background,
        fontFamily: 'Raleway',
        primaryColor: AppColors.primary,
      ),

      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case "/suits":
            {
              return MaterialPageRoute(builder: (context) {
                return CategoryScreen(
                );
                // return CategoryScreen(
                //   title: "SUITS",
                //   linkImage: "assets/imgs/landing_bg3.png",
                // );
              });
            }
            break;
        }

        return MaterialPageRoute(builder: (context) {
          return MenuProvider(child: MainMenuScaffold());
        });
      },
    );
  }
}
