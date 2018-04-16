import "package:flutter/material.dart";

import '../ui_styles/buttons.dart';
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
            transform: new Matrix4.identity()..scale(1.65),
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
              const Color(0x2A0F00).withOpacity(0.80),
              const Color(0x170800).withOpacity(0.86),
              const Color(0x000000).withOpacity(0.86),
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset("assets/graphics/logo.png"),
              new Form(
                child: new Theme(
                  data: new ThemeData(
                    primaryColor: Colors.red,
                    accentColor: Colors.white,
                    brightness: Brightness.dark,
                    inputDecorationTheme: new InputDecorationTheme(),
                    // primarySwatch: Colors.white
                  ),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        padding: new EdgeInsets.all(16.0),
                        child: new Column(
                          children: <Widget>[
                            new TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: new InputDecoration(
                                  hintText: "Username",
                                  labelStyle: new TextStyle(
                                    color: Colors.yellow,
                                  ),
                                  fillColor: Colors.white,
                                  icon: new Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  )),
                            ),
                            new Padding(padding: new EdgeInsets.all(16.0)),
                            new TextFormField(
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: new InputDecoration(
                                  hintText: "Password",
                                  labelStyle: new TextStyle(
                                    color: Colors.yellow,
                                  ),
                                  fillColor: Colors.white,
                                  icon: new Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  )),
                            ),
                            new Padding(padding: new EdgeInsets.all(16.0)),
                            new OutLineButton(
                                "LOGIN", () => print('login tapped')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Text("hello"),
                  new DefaultButton("SIGNUP", () => print('SIGNED UP tapped')),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
