import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';
import 'package:wears/generic_widgets/bottom_app_bar/wears_bottom_app_bar.dart';
import 'package:wears/src/screens/shop/tabs/favorites_screen.dart';
import 'package:wears/src/screens/shop/tabs/settings_screen.dart';
import 'package:wears/src/screens/shop/tabs/category/categories_screen.dart';
import 'package:wears/src/screens/shop/tabs/home/home_screen.dart';

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WearsTabBar(
      fab: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Image.asset(
          WearsIcons.cart,
          height: 25.0,
          color: WearsColors.primary,
        ),
        onPressed: () {},
      ),
      items: [
        WearsTabBarView(
          screen: HomeScreen(),
          name: "Home",
          iconImageLink: WearsIcons.home,
        ),
        WearsTabBarView(
            screen: CategoriesScreen(),
            name: "Category",
            iconImageLink: WearsIcons.category),
        WearsTabBarView(
          screen: FavoritesScreen(),
          name: "Favorites",
          iconImageLink: WearsIcons.favorite,
        ),
        WearsTabBarView(
          screen: SettingsScreen(),
          name: "settings",
          iconImageLink: WearsIcons.user,
        ),
      ],
    );
  }
}
