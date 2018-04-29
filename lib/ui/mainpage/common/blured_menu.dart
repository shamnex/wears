
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../data/constants.dart';
import '../../common/buttons.dart';
import 'blured_menu_scaffold.dart';


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
                sigmaX: 14.0 * widget.menuController.blurAnimation,
                sigmaY: 14.0 * widget.menuController.blurAnimation),
            child: new Transform(
              transform: new Matrix4.identity()..scale(1.0 *widget.menuController.noAnimation),
              child: buildMenu(widget.menuController),
              ) 
          ),
        )
      ],
    );
  }
}


buildMenu(MenuController menuController) {
  return new Opacity(
    opacity: 1.0 * menuController.blurAnimation,
      child: new Column(
    children: <Widget>[
      new Expanded(
        flex: 1,
        child: new Container(
          decoration:new BoxDecoration(color: Colors.white.withOpacity(0.5)),
                  child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                new MaterialButton(
                  child: new Image.asset(AppIcons.close),
                  onPressed: 
                   menuController.state == MenuState.closing || menuController.state == MenuState.opening
                   ?
                   null:() {
                     menuController.close();
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
      ),
      new Expanded(
        flex: 8,
        child: new Column(
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
      new Expanded(flex: 1, child: new DefaultButton("SIGN OUT", 0.0, () {
        
      }))
    ],
      ),
  );
}

Widget creatMenuItem(String _text, bool _isActive, VoidCallback _onPressed) {
  return new Expanded(
    child: new Container(
      width: double.infinity,
      decoration: _isActive
          ? new BoxDecoration(color: Colors.white.withOpacity(0.75), boxShadow: [
              new BoxShadow(
                  offset: new Offset(0.0, 15.0),
                  blurRadius: 12.0,
                  color: Colors.black.withOpacity(0.5))
            ])
          : new BoxDecoration(color: Colors.white.withOpacity(0.5)),
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
