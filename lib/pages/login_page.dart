import "package:flutter/material.dart";

import '../ui_styles/gradient_overlay.dart';

class LoginPage extends StatefulWidget {
  LoginPageSate createState() => new LoginPageSate();
}

class LoginPageSate extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Stack(
  
        fit: StackFit.expand,
        children: <Widget>[
          new Transform(
            transform: new Matrix4.identity()..scale(1.0),
            child: new DecoratedBox(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                fit: BoxFit.cover,
                image: new AssetImage("assets/imgs/pattern.jpg"),
              )),
            ),
          ),
          new GradientOverlay(
            <Color>[
              const Color(0x000000).withOpacity(0.7),
              const Color(0x2A0F00).withOpacity(0.8)
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset("assets/graphics/logo.png"),
              new Form(
                child: new Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,
                    inputDecorationTheme: new InputDecorationTheme(
                  
                    ),
                    // primarySwatch: Colors.white
                  ),
                   child: new Column(
                    children: <Widget>[
                      new Container(
                        padding: new EdgeInsets.all(10.0),
                          child: new TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: new InputDecoration(
                          
                              hintText: "Username",
                                  labelStyle: new TextStyle(
                        color: Colors.yellow,

                        
                      ),
                              fillColor: Colors.white,
                              icon: new Icon(Icons.person, color: Colors.white,)),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
