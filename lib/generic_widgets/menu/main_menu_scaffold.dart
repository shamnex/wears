import 'dart:ui';

import 'package:flutter/material.dart';
export 'screen.dart';
import 'main_menu.dart';
import 'menu_controller.dart';
import 'screen.dart';
export 'screen.dart';

class MainMenuScaffold extends StatefulWidget {
  final List<Screen> screens;
  MainMenuScaffold({this.screens});

  @override
  MainMenuScaffoldState createState() => MainMenuScaffoldState();
}

class MainMenuScaffoldState extends State<MainMenuScaffold>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> blur;
  Animation<double> opacity;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    blur = Tween(
      begin: 0.0,
      end: 16.0,
    ).animate(
      CurvedAnimation(
          parent: animationController,
          curve: Interval(
            0.2,
            0.700,
            curve: Curves.ease,
          ),
          reverseCurve: Interval(
            0.2,
            1.0,
            curve: Curves.ease,
          )),
    );

    opacity = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
          parent: animationController,
          curve: Interval(
            0.0,
            0.02,
            curve: Curves.ease,
          ),
          reverseCurve: Interval(
            0.0,
            0.2,
            curve: Curves.ease,
          )),
    );

    menuController.ismenuOpen$.listen((data) {
      data == true
          ? animationController.forward()
          : animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildScaffold(context);
  }

  Widget buildScaffold(context) {
    menuController.changeActiveScreeen$(widget.screens[0]);

    return StreamBuilder(
      stream: menuController.activeScreen$,
      builder: (BuildContext context, AsyncSnapshot<Screen> snapshot) {
        return Material(
          child: new Stack(children: <Widget>[
            snapshot.hasData
                ? snapshot.data
                : Center(
                    child: Material(),
                  ),
            AnimatedBuilder(
              animation: blur,
              builder: (BuildContext context, Widget child) {
                return BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: blur.value,
                      sigmaY: blur.value,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * opacity.value,
                      color: Colors.transparent,
                    ));
              },
            ),
            MainMenu(
              screens: widget.screens,
            ),
          ]),
        );
      },
    );
  }
}
