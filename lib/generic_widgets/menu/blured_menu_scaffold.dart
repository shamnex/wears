import 'dart:ui';

import 'package:flutter/material.dart';
export 'screen.dart';
import 'blured_menu.dart';
import 'blured_menu_controller.dart';
import 'screen.dart';
export 'screen.dart';

class BluredMenuScaffold extends StatefulWidget {
  final List<BluredMenuScreen> screens;
  BluredMenuScaffold({this.screens});

  @override
  BluredMenuScaffoldState createState() => BluredMenuScaffoldState();
}

class BluredMenuScaffoldState extends State<BluredMenuScaffold>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> blur;
  Animation<double> opacity;
  Animation<double> menuAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

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
            0.2,
            curve: Curves.ease,
          ),
          reverseCurve: Interval(
            0.0,
            0.2,
            curve: Curves.ease,
          )),
    );

    menuAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
          parent: animationController,
          curve: Interval(
            0.0,
            0.3,
            curve: Curves.easeInOut,
          ),
          reverseCurve: Interval(
            0.0,
            0.3,
            curve: Curves.easeInOut,
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
      builder:
          (BuildContext context, AsyncSnapshot<BluredMenuScreen> snapshot) {
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
            BluredMenu(
              screens: widget.screens,
            ),
            SafeArea(
              child: Hero(
                tag: "menuButton",
                child: GestureDetector(
                  onTap: () => menuController.toggleMenu$,
                  child: Container(
                    margin: EdgeInsets.only(left: 20.0),
                    alignment: Alignment.centerLeft,
                    width: 50.0,
                    color: Colors.transparent,
                    height: 50.0,
                    child: Stack(
                      children: <Widget>[
                        AnimatedBuilder(
                          animation: menuAnimation,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: -0.785398 * menuAnimation.value,
                              child: Container(
                                height: 2.5,
                                width: 20.0 + (menuAnimation.value * 10),
                                color: Theme.of(context).primaryColor,
                              ),
                            );
                          },
                        ),
                        AnimatedBuilder(
                          animation: menuAnimation,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: 0.785398 * menuAnimation.value,
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 8.0 * (1 - menuAnimation.value)),
                                height: 2.5,
                                width: 30.0,
                                color: Theme.of(context).primaryColor,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}
