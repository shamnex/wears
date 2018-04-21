
import 'dart:ui';
import "package:flutter/material.dart";

 blurContent() {
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
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.9),
                  ]),
            ),
            height: double.infinity,
            width: double.infinity,
            child: new Text(""),
          ),
        ),
      )
    ],
  );
}