import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';
import 'package:wears/generic_widgets/menu/blured_menu_scaffold.dart';
import 'package:wears/src/blocs/bloc.dart';
import 'package:wears/src/blocs/login/login_bloc.dart';
import 'package:wears/src/screens/auth/login_screen.dart';
import 'package:wears/src/screens/main/cart_screen.dart';
import 'package:wears/src/screens/main/favorites_screen.dart';
import 'package:wears/src/screens/main/main_screen.dart';
import 'package:wears/src/screens/main/settings_screen.dart';
import 'package:wears/src/screens/main/tabs/category/category_details_screen.dart';
import 'package:wears/src/screens/main/tabs/category/category_home_screen.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: BlocProvider(child:LoginScreen(), bloc: LoginBloc(),),
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: AppColors.background,
        fontFamily: 'Raleway',
        primaryColor: AppColors.primary,
      ),

      onGenerateRoute: (RouteSettings settings) {
        if (settings.name.contains("category")) {
          final category = settings.name.replaceAll("category", "");
        }
        switch (settings.name) {
          case "category/suits":
            {
              return MaterialPageRoute(builder: (context) {
                return CategoryDetailsScreen();
              });
            }
            break;
        }

        return MaterialPageRoute(builder: (context) {
          return BluredMenuScaffold(
            screens: [
              BluredMenuScreen(
                title: "Main",
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
