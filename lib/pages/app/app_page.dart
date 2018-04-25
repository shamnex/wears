import 'package:flutter/material.dart';
import '../../blur_scaffold.dart';
import '../app/screens/account_screen.dart';
import '../menu.dart';
import 'screens/home_screen.dart';

class AppPage extends StatefulWidget {
  @override
  AppPageState createState() => new AppPageState();
}

class AppPageState extends State<AppPage> {

  var activeScreen = homeScreen;
  @override
  Widget build(BuildContext context) {
    return new BlurScaffold(
      screen: homeScreen,
      );
  }
}


