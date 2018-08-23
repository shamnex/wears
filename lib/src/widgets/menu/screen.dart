import 'package:flutter/material.dart';
import 'package:wears/src/screens/home_screen.dart';

import '../../data/constants.dart';
import 'blured_menu_scaffold.dart';

class Screen {
  final String title;
  final WidgetBuilder contenBuilder;
  Screen({this.title, this.contenBuilder});
}

buildScreen(  {Screen activeScreen, BuildContext context}) {
  if (activeScreen == HomeScreen ) {
    return new Scaffold(
      backgroundColor: AppColors.background,
      appBar: new AppBar(
        toolbarOpacity: 1.0,
        leading: new IconButton(
          color: AppColors.primary,
          onPressed:() {},
          disabledColor: Colors.grey,
          icon: new ImageIcon(
            new AssetImage("assets/icons/menu.png"),
            size: 30.0,
            color: AppColors.primary,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: new Center(
          child: new Padding(
            padding: const EdgeInsets.only(right: 55.0),
            child: new Text(
              activeScreen.title,
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: AppColors.primary),
            ),
          ),
        ),
      ),
      body: activeScreen.contenBuilder(context),
    );
  }
  return activeScreen.contenBuilder(context);
}
