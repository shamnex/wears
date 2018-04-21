import 'dart:ui';

import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../ui_styles/gradient_overlay.dart';
import 'home_styles.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

blurContent(Widget widget) {
  return new Column(
    children: <Widget>[
      new Expanded(
        child: new BackdropFilter(
          filter: new ImageFilter.blur(
            sigmaX: 17.0,
            sigmaY: 17.0,
          ),
          child: new Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.8),
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.9),
                  ]),
            ),
            height: double.infinity,
            width: double.infinity,
            child: widget,
          ),
        ),
      )
    ],
  );
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Stack(
        children: <Widget>[
          createHomePage(),
          new GradientOverlay([Colors.blue, Colors.black]),

          // new Transform(
          // )
          blurContent(buildMenu())
        ],
      ),
    );
  }
}

createHomePage() {
  return new Scaffold(
    backgroundColor: const Color(0xFFE8E8E8),
    appBar: new AppBar(
      leading: new IconButton(
        onPressed: () {},
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
            "HOME",
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: AppColors.primary),
          ),
        ),
      ),
    ),
    body: new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Column(
        children: <Widget>[
          new Expanded(
            flex: 5,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new Column(
                    children: <Widget>[
                      new Expanded(
                        flex: 1,
                        child: new Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new HomeLinkStyle(
                                'WATCHES', "assets/imgs/watch.png")),
                      ),
                      new Expanded(
                        flex: 1,
                        child: new Container(
                          child: new Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new HomeLinkStyle(
                                  'SHOES', 'assets/imgs/shoe.png')),
                        ),
                      ),
                    ],
                  ),
                ),
                new Expanded(
                  flex: 1,
                  child: new Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new HomeLinkStyle(
                          'SUITS', 'assets/imgs/landing_bg3.png')),
                )
              ],
            ),
          ),
          new Expanded(
            flex: 2,
            child: new Padding(
                padding: const EdgeInsets.all(2.0),
                child: new HomeLinkStyle('ACCESORIES', 'assets/imgs/bag.png')),
          )
        ],
      ),
    ),
  );
}

buildMenu() {
  return new Column(
    children: <Widget>[
      new Expanded(
        flex: 1,
        child: new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Image.asset(AppIcons.close),
              new Image.asset(AppIcons.logoIcon),
            ],
          ),
        ),
      ),

      new Expanded(
        flex: 5,
        child: new Column(
          children: <Widget>[
            new Expanded(
              child: new Container(
                width: double.INFINITY,
                child: new Center(
                  child: new Text(
                    "HOME",
                    style: new TextStyle(),
                  ),
                ),
              ),
            ),

            new Expanded(
              child: new Container(
                width: double.INFINITY,
                decoration: new BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  boxShadow: [
                    new BoxShadow(
                      offset: Offset.zero,
                      blurRadius: 12.0,
                      color: Colors.black.withOpacity(0.3)
                    )
                  ]
                  ),
                child: new Center(
                  child: new Text(
                    "CART",
                    style: new TextStyle(
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
            ),

            new Expanded(
              child: new Container(
                width: double.INFINITY,
                child: new Center(
                  child: new Text(
                    "FAVORITES",
                    style: new TextStyle(),
                  ),
                ),
              ),
            ),

            new 

            new Expanded(
              child: new Container(
                width: double.INFINITY,
                child: new Center(
                  child: new Text(
                    "SETTINGS",
                    style: new TextStyle(),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}
