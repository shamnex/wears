import 'package:flutter/material.dart';
import 'common/blured_menu_scaffold.dart';

import 'home/home_screen.dart';

class MainPage extends StatefulWidget {
  final activeScreen = homeScreen;
  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return new BluredMenuScaffold(
      screen: widget.activeScreen,
    );
  }
}
