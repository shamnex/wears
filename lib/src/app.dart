import 'package:flutter/material.dart';
import 'screens/category_screen.dart';
import '../generic_widgets/menu/main_menu_scaffold.dart';
import '../data/constants.dart';

import '../src/screens/home_screen.dart';
import '../src/screens/settings_screen.dart';
import '../src/screens/favorites_screen.dart';
import '../src/screens/cart_screen.dart';

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
                return CategoryScreen();
                // return CategoryScreen(
                //   title: "SUITS",
                //   linkImage: "assets/imgs/landing_bg3.png",
                // );
              });
            }
            break;
        }

        return MaterialPageRoute(builder: (context) {
       return MainMenuScaffold(
            screens: [
              Screen(
                title: "Home",
                body: HomeScreen(),
              ),
              Screen(
                title: "Cart",
                body: CartScreen(),
              ),
              Screen(
                title: "Favorites",
                body: FavoritesScreen(),
              ),
              Screen(
                title: "Settings",
                body: SettingsScreen(),
              ),
            ],
          );
        });
      },
    );
  }
}
