import 'package:flutter/material.dart';

class HomeLinkStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(),
      child: new Column(
        children: <Widget>[
          new Expanded(
            flex: 2,
            child: new Container(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                image: new AssetImage("assets/imgs/landing_bg3.png"),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    const Color(0xFF481300).withOpacity(1.0), BlendMode.screen),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
