import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';
import 'package:wears/generic_widgets/menu/blured_menu_scaffold.dart';
import 'package:wears/generic_widgets/route_animations/route_animations.dart';
import 'package:wears/src/blocs/bloc.dart';
import 'package:wears/src/blocs/login/login_bloc.dart';
import 'package:wears/src/models/category.dart';
import 'package:wears/src/screens/auth/login_screen.dart';
import 'package:wears/src/screens/shop/tabs/cart_screen.dart';
import 'package:wears/src/screens/shop/tabs/favorites_screen.dart';
import 'package:wears/src/screens/shop/shop_screen.dart';
import 'package:wears/src/screens/shop/tabs/settings_screen.dart';
import 'package:wears/src/screens/shop/tabs/category/category_screen.dart';
import 'package:wears/src/screens/shop/tabs/category/categories_screen.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: BlocProvider(child:LoginScreen(), bloc: LoginBloc(),),
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: WearsColors.background,
        fontFamily: 'Raleway',
        primaryColor: WearsColors.primary,
      ),

      onGenerateRoute: (RouteSettings settings) {
        if (settings.name.toLowerCase().contains("category")) {
          final categoryName =
              settings.name.toLowerCase().replaceAll("category/", "");


          return FadeInRoute(builder: (context) {
            return CategoryScreen(categoryName: categoryName);
          });
        }
        // switch (settings.name) {
        //   case "category/category":
        //     {}
        //     break;
        // }

        return FadeInRoute(builder: (context) {
          return BluredMenuScaffold(
            screens: [
              BluredMenuScreen(
                title: "Shop",
                body: ShopScreen(),
              ),
              // BluredMenuScreen(
              //   title: "Cart",
              //   body: CartScreen(),
              // ),
              // BluredMenuScreen(
              //   title: "Favorites",
              //   body: FavoritesScreen(),
              // ),
              // BluredMenuScreen(
              //   title: "Settings",
              //   body: SettingsScreen(),
              // ),
            ],
          );
        });
      },
    );
  }
}
