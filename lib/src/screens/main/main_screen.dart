import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';
import 'package:wears/generic_widgets/bottom_app_bar/wears_bottom_app_bar.dart';
import 'package:wears/src/screens/main/favorites_screen.dart';
import 'package:wears/src/screens/main/home_screen.dart';
import 'package:wears/src/screens/main/settings_screen.dart';
import 'package:wears/src/screens/main/tabs/category/category_home_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WearsTabBar(
      fab: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Image.asset(
          AppIcons.cart,
          height: 25.0,
          color: AppColors.primary,
        ),
        onPressed: () {},
      ),
      items: [
        WearsTabBarView(
          screen: HomeScreen(),
          name: "Home",
          iconImageLink: AppIcons.home,
        ),
        WearsTabBarView(
            screen: CategoryHomeScreen(),
            name: "Category",
            iconImageLink: AppIcons.category),
        WearsTabBarView(
          screen: FavoritesScreen(),
          name: "Favorites",
          iconImageLink: AppIcons.favorite,
        ),
        WearsTabBarView(
          screen: SettingsScreen(),
          name: "settings",
          iconImageLink: AppIcons.user,
        ),
      ],
    );
  }
}
