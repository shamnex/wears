import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';
import 'package:wears/src/screens/wears/category_screen.dart';
import 'package:wears/src/screens/wears/favorites_screen.dart';
import 'package:wears/src/screens/wears/home_screen.dart';
import 'package:wears/src/screens/wears/settings_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() {
    return new MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  int _currentScreenIndex = 0;
  Widget _currentScreen;
  final List<Widget> _screens = [
    HomeScreen(),
    CategoryScreen(),
    SettingsScreen(),
    FavoritesScreen(),
  ];

  @override
  initState() {
    changeScreen(_currentScreenIndex);
    super.initState();
  }

  changeScreen(int index) {
    _currentScreenIndex = index;
    _currentScreen = _screens[_currentScreenIndex];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: AppColors.background,
      body: _currentScreen,
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  Widget buildBottomNavigation() {
    return BottomAppBar(
        elevation: 0.0,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buildItemList([
            [
              "Home",
              AppIcons.home,
            ],
            [
              "category",
              AppIcons.category,
            ],
            [
              "favoriteS",
              AppIcons.favorite,
            ],
            [
              "user",
              AppIcons.user,
            ],
          ]),
        ));
  }


  List<Widget> buildItemList(List<List<String>> items) {
    final List<Widget> _ = [];
    items.asMap().forEach(
          (index, item) => _.add(
                buildItem(name: item[0], iconLink: item[1], index: index),
              ),
        );

    return _;
  }


  Widget buildAppBar(BuildContext context) {
    return AppBar(
      toolbarOpacity: 1.0,
      elevation: .0,
      backgroundColor: Colors.transparent,
      title: Container(
        alignment: Alignment.center,
        child: Text(
          "Home",
          style: TextStyle(
              fontFamily: 'Antonio',
              fontWeight: FontWeight.w900,
              fontSize: 22.0,
              color: AppColors.primary),
        ),
      ),
    );
  }

  Widget buildItem({String name, String iconLink, int index}) {
    return GestureDetector(
        onTap: () {
    setState(() {
      changeScreen(index);
    });
        },
        child: Container(
    height: 60.0,
    padding: EdgeInsets.all(5.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.asset(
          iconLink,
          color: _currentScreenIndex == index
              ? AppColors.primary
              : AppColors.background,
          height: 26.0,
        ),
        Text(
          name.toUpperCase(),
          style: TextStyle(
            fontSize: 10.0,
            
            color: _currentScreenIndex == index
                ? AppColors.primary
                : AppColors.background,
          ),
        )
      ],
    ),
        ),
      );
  }
}
