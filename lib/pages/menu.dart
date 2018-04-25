import 'dart:ui' show FontWeight, ImageFilter, Offset, VoidCallback;
import 'package:flutter/material.dart';

import '../blur_scaffold.dart';
import '../constants.dart';
import '../ui_elements/buttons.dart';

class BluredMenu extends StatefulWidget {
  final MenuController menuController;

  BluredMenu(this.menuController);

  @override
  BluredMenuState createState() {
    return new BluredMenuState();
  }
}

class BluredMenuState extends State<BluredMenu> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Expanded(
          child: new BackdropFilter(
            filter: new ImageFilter.blur(
                sigmaX: 14.0 * widget.menuController.blur,
                sigmaY: 14.0 * widget.menuController.blur),
            child: new Opacity(
              opacity: 1.0 * widget.menuController.blur ,
              child: new Container(
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.8),
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.9),
                        ]),
                  ),
                  height: double.infinity,
                  width: double.infinity,
                  child: new Opacity(
                    opacity: 1.0,
                    child: buildMenu(widget.menuController),
                  )),
            ),
          ),
        )
      ],
    );
  }
}

buildMenu(MenuController menuController) {
  return new Column(
    children: <Widget>[
      new Expanded(
        flex: 1,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new MaterialButton(
              child: new Image.asset(AppIcons.close),
              minWidth: double.MIN_POSITIVE,
              onPressed: () {
                menuController.toggle();
              },
            ),
            new Transform(
              transform: new Matrix4.translationValues(0.0, 5.0, 0.0),
              child: new MaterialButton(
                  onPressed: () {}, child: new Image.asset(AppIcons.logoIcon)),
            ),
          ],
        ),
      ),
      new Expanded(
        flex: 8,
        child: new Opacity(
          opacity: menuController.blur,
          child: new Column(
            children: <Widget>[
              creatMenuItem('HOME', false, () {
                menuController.close();
              }),
              creatMenuItem('CART', true, () {
                menuController.close();
              }),
              creatMenuItem('FAVORITES', false, () {
                menuController.close();
              }),
              creatMenuItem('SETTINGS', false, () {
                menuController.open();
              }),
            ],
          ),
        ),
      ),
      new Expanded(flex: 1, child: new DefaultButton("SIGN OUT", 0.0, () {}))
    ],
  );
}

Widget creatMenuItem(String _text, bool _isActive, VoidCallback _onPressed) {
  return new Expanded(
    child: new Container(
      width: double.INFINITY,
      decoration: _isActive
          ? new BoxDecoration(color: Colors.white.withOpacity(0.5), boxShadow: [
              new BoxShadow(
                  offset: new Offset(0.0, 10.0),
                  blurRadius: 12.0,
                  color: Colors.black.withOpacity(0.2))
            ])
          : null,
      child: new MaterialButton(
        onPressed: _isActive ? null : _onPressed,
        child: new Center(
          child: new Text(
            _text,
            style: new TextStyle(
                color: AppColors.primary,
                fontWeight: _isActive ? FontWeight.w500 : FontWeight.normal),
          ),
        ),
      ),
    ),
  );
}
