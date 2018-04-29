import 'package:flutter/material.dart';
import 'category/category_screen.dart';
import 'common/blured_menu_scaffold.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPage> {

  var activeScreen = categoryScreen;
  @override
  Widget build(BuildContext context) {
    return new BluredMenuScaffold(
      screen: activeScreen,
      );
  }
}


