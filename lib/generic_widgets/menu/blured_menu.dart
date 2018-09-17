import 'package:flutter/material.dart';
import '../../data/constants.dart';
import 'blured_menu_controller.dart';
import '../menu/screen.dart';

class BluredMenu extends StatefulWidget {
  final List<BluredMenuScreen> screens;

  BluredMenu({this.screens});

  @override
  BluredMenuState createState() {
    return BluredMenuState();
  }
}

class BluredMenuState extends State<BluredMenu> with TickerProviderStateMixin {
  Animation<double> blur;
  Animation<double> scale;
  Animation<double> opacity;
  Animation<double> translate;
  AnimationController menuAnimcontroller;
  //menu animation
  Animation<double> menuAnimation;

  initState() {
    super.initState();
    menuAnimcontroller = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    menuAnimcontroller.addStatusListener((AnimationStatus status) {
      menuController.changeAnimationStatus$(status);
    });

    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: menuAnimcontroller,
        curve: Interval(
          0.000,
          0.400,
          curve: Curves.ease,
        ),
      ),
    );

    blur = Tween(
      begin: 0.0,
      end: 16.0,
    ).animate(
      CurvedAnimation(
          parent: menuAnimcontroller,
          curve: Interval(
            0.2,
            0.700,
            curve: Curves.ease,
          ),
          reverseCurve: Interval(
            0.0,
            1.00,
            curve: Curves.ease,
          )),
    );

    scale = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: menuAnimcontroller,
        curve: Interval(
          0.0,
          0.400,
          curve: Curves.fastOutSlowIn,
        ),
        reverseCurve: Interval(
          0.0,
          0.400,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    translate = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: menuAnimcontroller,
        curve: Interval(
          0.0,
          0.900,
          curve: Curves.elasticOut,
        ),
        reverseCurve: Interval(
          0.0,
          .4,
          curve: Curves.easeIn,
        ),
      ),
    );

    menuController.ismenuOpen$.listen((data) {
      data == true
          ? menuAnimcontroller.forward()
          : menuAnimcontroller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildMenu();
  }

  buildMenu() {
    return Column(
      children: <Widget>[
        Expanded(
          child: StreamBuilder(
            stream: menuController.ismenuOpen$,
            builder: (BuildContext context, snapshot) {
              return AnimatedBuilder(
                animation: scale,
                child: Column(
                  children: <Widget>[
                    buildMenuBar(),
                    buildMenuList(),
                  ],
                ),
                builder: (BuildContext context, Widget child) {
                  return Transform(
                      transform: Matrix4.identity()
                        ..translate(translate.value *
                            -(MediaQuery.of(context).size.width + 10.0)),
                      // transform: Matrix4.identity()..scale(1.0)
                      child: child);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildMenuBar() {
    return Container(
      height: 80.0,
      // padding: EdgeInsets.only(top: 15.0),
      // decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: <Widget>[
      //     MaterialButton(
      //         child: Image.asset(AppIcons.close,
      //             color: Theme.of(context).primaryColor),
      //         onPressed: () => menuController.isAnimating
      //             ? null
      //             : menuController.closeMenu$),
      //     MaterialButton(
      //       onPressed: null,
      //       child: Image.asset(AppIcons.logoIcon,
      //           color: Theme.of(context).primaryColor
      //           // color: Colors.white,
      //           ),
      //       height: 10.0,
      //     )
      //   ],
      // ),
    );
  }

  Widget buildMenuList() {
    return StreamBuilder(
      stream: menuController.activeScreenTitle$,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Expanded(
          flex: 12,
          child: Column(
              children: widget.screens
                  .map((BluredMenuScreen screen) => buildMenuItem(
                        title: screen.title,
                        isActive: snapshot.data == screen.title,
                        onPressed: () {
                          if(menuAnimcontroller.isAnimating) {
                            return null;
                          }
                          
                          menuController.closeMenu$;
                          menuController.changeActiveScreeen$(screen);
                        },
                      ))
                  .toList()),
        );
      },
    );
  }

  Widget buildMenuItem({String title, bool isActive, Function onPressed}) {
    return Expanded(
      flex: 2,
      child: Container(
        width: double.infinity,
        decoration: isActive
            ? BoxDecoration(color: Colors.white.withOpacity(0.75), boxShadow: [
                BoxShadow(
                    offset: Offset(0.0, 5.0),
                    blurRadius: 20.0,
                    spreadRadius: 1.0,
                    color: Colors.black.withOpacity(0.3))
              ])
            : BoxDecoration(color: Colors.white.withOpacity(0.5)),
        child: MaterialButton(
          onPressed: isActive ? null : onPressed,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: isActive
                      ? AppColors.primary
                      : Colors.black.withOpacity(0.6),
                  fontWeight: isActive ? FontWeight.w900 : FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }
}
