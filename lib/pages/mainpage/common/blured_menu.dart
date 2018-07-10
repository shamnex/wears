import 'dart:ui' show FontWeight, ImageFilter, Offset, VoidCallback;
import 'package:flutter/material.dart';
import 'package:wears/ui/buttons.dart';
import '../../../data/constants.dart';
import 'blured_menu_scaffold.dart';

class BluredMenu extends StatefulWidget {
  final MenuController menuController;
  BluredMenu(this.menuController);

  @override
  BluredMenuState createState() {
    return BluredMenuState();
  }
}

class BluredMenuState extends State<BluredMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 14.0 * widget.menuController.blurAnimation,
                  sigmaY: 14.0 * widget.menuController.blurAnimation),
              child: Transform(
                transform: Matrix4.identity()
                  ..scale(1.0 * widget.menuController.noAnimation),
                child: buildMenu(widget.menuController),
              )),
        )
      ],
    );
  }
}

buildMenu(MenuController menuController) {
  return Opacity(
    opacity: 1.0 * menuController.blurAnimation,
    child: Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                MaterialButton(
                  child: Image.asset(AppIcons.close),
                  onPressed: menuController.state == MenuState.closing ||
                          menuController.state == MenuState.opening
                      ? null
                      : () {
                          menuController.close();
                        },
                ),
                Transform(
                  transform: Matrix4.translationValues(0.0, 5.0, 0.0),
                  child: MaterialButton(
                      onPressed: () {}, child: Image.asset(AppIcons.logoIcon)),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Column(
            children: <Widget>[
              creatMenuItem('HOME', false, () {
                menuController.close();
              }),
              creatMenuItem('CART', false, () {
                menuController.close();
              }),
              creatMenuItem('FAVORITES', true, () {
                menuController.close();
              }),
              creatMenuItem('SETTINGS', false, () {
                menuController.close();
              }),
            ],
          ),
        ),
        Expanded(flex: 1, child: DefaultButton("SIGN OUT", 0.0, () {}))
      ],
    ),
  );
}

Widget creatMenuItem(String _text, bool _isActive, VoidCallback _onPressed) {
  return Expanded(
    child: Container(
      width: double.infinity,
      decoration: _isActive
          ? BoxDecoration(color: Colors.white.withOpacity(0.75), boxShadow: [
              BoxShadow(
                  offset: Offset(0.0, 15.0),
                  blurRadius: 12.0,
                  color: Colors.black.withOpacity(0.5))
            ])
          : BoxDecoration(color: Colors.white.withOpacity(0.5)),
      child: MaterialButton(
        onPressed: _isActive ? null : _onPressed,
        child: Center(
          child: Text(
            _text,
            style: TextStyle(
                color: AppColors.primary,
                fontWeight: _isActive ? FontWeight.w500 : FontWeight.normal),
          ),
        ),
      ),
    ),
  );
}
