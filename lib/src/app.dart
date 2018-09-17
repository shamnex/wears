import 'package:flutter/material.dart';
import 'package:wears/src/screens/wears/cart_screen.dart';
import 'package:wears/src/screens/wears/category_screen.dart';
import 'package:wears/src/screens/wears/favorites_screen.dart';
import 'package:wears/src/screens/wears/main_screen.dart';
import 'package:wears/src/screens/wears/settings_screen.dart';
import '../generic_widgets/menu/blured_menu_scaffold.dart';
import '../data/constants.dart';



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
       return BluredMenuScaffold(
            screens: [
              BluredMenuScreen(
                title: "Home",
                body: MainScreen(),
              ),
              BluredMenuScreen(
                title: "Cart",
                body: CartScreen(),
              ),
              BluredMenuScreen(
                title: "Favorites",
                body: FavoritesScreen(),
              ),
              BluredMenuScreen(
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
