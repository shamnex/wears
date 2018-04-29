import 'package:flutter/material.dart';
import 'category/category_screen.dart';
import 'common/blured_menu_scaffold.dart';
import 'package:scoped_model/scoped_model.dart';

import 'home/home_screen.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => new MainPageState();
}



class MainPageState extends State<MainPage> {

  var activeScreen = homeScreen;
  @override
  Widget build(BuildContext context) {
    return new BluredMenuScaffold(
      screen: activeScreen,
      );
  }
}


