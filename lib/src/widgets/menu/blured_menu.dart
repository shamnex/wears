import 'dart:ui' show FontWeight, ImageFilter, Offset, VoidCallback;
import 'package:flutter/material.dart';
import '../../data/constants.dart';
import '../../widgets/buttons.dart';
import 'blured_menu_scaffold.dart';

class BluredMenu extends StatefulWidget {
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
              filter: ImageFilter.blur(sigmaX: 14.0, sigmaY: 14.0),
              child: Transform(
                transform: Matrix4.identity()..scale(1.0),
                child: buildMenu(),
              )),
        )
      ],
    );
  }

  buildMenu() {
    return Opacity(
      opacity: 1.0,
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
                    onPressed: () {},
                  ),
                  Transform(
                    transform: Matrix4.translationValues(0.0, 5.0, 0.0),
                    child: MaterialButton(
                        onPressed: () {},
                        child: Image.asset(AppIcons.logoIcon)),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Column(
              children: <Widget>[
                buildMenuItem('HOME', false, () {}),
                buildMenuItem('CART', false, () {}),
                buildMenuItem('FAVORITES', true, () {}),
                buildMenuItem('SETTINGS', false, () {}),
              ],
            ),
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
  }

  Widget buildMenuItem(String _text, bool _isActive, VoidCallback _onPressed) {
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
}
