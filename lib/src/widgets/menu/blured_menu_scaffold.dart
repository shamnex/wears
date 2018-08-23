import 'package:flutter/material.dart';
import 'blured_menu.dart';
import 'screen.dart';

class MainMenu extends StatelessWidget {
  final Screen screen;
  MainMenu({this.screen});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(children: <Widget>[
        buildScreen(activeScreen: screen, context: context),
        BluredMenu()
      ]),
    );
  }
}
