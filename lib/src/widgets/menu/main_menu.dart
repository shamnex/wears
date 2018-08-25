import 'dart:ui' show FontWeight, ImageFilter, Offset, VoidCallback;
import 'package:flutter/material.dart';
import '../../blocs/menu/menu_bloc.dart';
import '../../data/constants.dart';
import '../../widgets/buttons.dart';

enum menuController { opened, opening, closed, closing }

class MainMenu extends StatefulWidget {
  final MenuBloc bloc;
  MainMenu(this.bloc);

  @override
  MainMenuState createState() {
    return MainMenuState();
  }
}

class MainMenuState extends State<MainMenu> with TickerProviderStateMixin {
  Animation<double> blur;
  Animation<double> scale;
  Animation<double> opacity;
  AnimationController controller;
  //menu animation
  Animation<double> menuAnimation;
  AnimationController menuController;

  initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    controller.addStatusListener((AnimationStatus status) {
      widget.bloc.changeAnimationStatus$(status);
    });

    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.000,
          0.400,
          curve: Curves.ease,
        ),
      ),
    );

    blur = Tween(
      begin: 0.0,
      end: 14.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.2,
          0.700,
          curve: Curves.ease,
        ),
        reverseCurve: Interval(
          0.2,
          0.700,
          curve: Curves.decelerate,
        )
      ),
    );

    scale = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
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

    widget.bloc.ismenuOpen$.listen((data) {
      data == true ? controller.forward() : controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildMenu(widget.bloc);
  }

  buildMenu(MenuBloc bloc) {
    return Column(
      children: <Widget>[
        Expanded(
          child: StreamBuilder(
            stream: bloc.ismenuOpen$,
            builder: (BuildContext context, snapshot) {
              return AnimatedBuilder(
                animation: blur,
                child: AnimatedBuilder(
                  animation: opacity,
                  child: Column(
                    children: <Widget>[
                      buildMenuBar(bloc),
                      buildMenuList(bloc),
                    ],
                  ),
                  builder: (BuildContext context, Widget child) {
                    return Transform(
                        transform: Matrix4.identity()..scale(1.0, scale.value),
                        // transform: Matrix4.identity()..scale(1.0)
                        child: child);
                  },
                ),
                builder: (BuildContext context, Widget child) {
                  return BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: blur.value,
                      sigmaY: blur.value,
                    ),
                    child: child,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildMenuBar(MenuBloc bloc) {
    return Expanded(
      flex: 2,
      child: Container(
        padding: EdgeInsets.only(top: 15.0),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.5)),
        // color: Colors.white.withOpacity(0.5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              child: Image.asset(
                AppIcons.close,
                color: Colors.white,
              ),
              onPressed: () {
                bloc.toggleMenu$(false);
              },
            ),
            MaterialButton(
              onPressed: null,
              child: Image.asset(
                AppIcons.logoIcon,
                color: Colors.white,
              ),
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }

  Widget buildMenuList(MenuBloc bloc) {
    return StreamBuilder(
      stream: bloc.activeScreenTitle$,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Expanded(
          flex: 12,
          child: Column(
            children: <Widget>[
              buildMenuItem(
                title: 'HOME',
                isActive: snapshot.data == "HOME",
                onPressed: () {},
              ),
              buildMenuItem(
                title: "CART",
                isActive: snapshot.data == "CART",
                onPressed: () {},
              ),
              buildMenuItem(
                title: 'FAVORITES',
                isActive: snapshot.data == "FAVORITES",
                onPressed: () {},
              ),
              buildMenuItem(
                title: 'SETTINGS',
                isActive: snapshot.data == "SETTINGS",
                onPressed: () {},
              ),
              Expanded(
                flex: 1,
                child: DefaultButton(
                  text: Text("SIGN OUT"),
                  isDisabled: false,
                  onPressed: () {},
                ),
              ),
            ],
          ),
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
                    offset: Offset(0.0, 15.0),
                    blurRadius: 12.0,
                    color: Colors.black.withOpacity(0.5))
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
                  fontWeight: isActive ? FontWeight.w500 : FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }
}
