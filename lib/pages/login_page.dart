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
            transform: new Matrix4.identity()..scale(1.5),
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
              const Color(0x000000).withOpacity(0.87),
              const Color(0x170800).withOpacity(0.86),
            ],
          ),
          new Container(
            padding:
                new EdgeInsets.symmetric(vertical: 110.0, horizontal: 30.0),
            child: new Column(
              children: <Widget>[
                new Image.asset("assets/graphics/logo.png"),
                new Padding(padding: new EdgeInsets.all(17.0)),

                new Form(
                  child: new Theme(
                    data: new ThemeData(
                      accentColor: Colors.white,
                      brightness: Brightness.dark,
                    ),
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
                        new Padding(padding: new EdgeInsets.all(19.0)),
                        new TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: new InputDecoration(
                              hintText: "Password",
                              labelStyle: new TextStyle(
                                  color: Colors.yellow, fontSize: 20.0),
                              fillColor: Colors.white,
                              icon: new Icon(
                                Icons.lock,
                                color: Colors.white,
                              )),
                        ),
                        new Padding(padding: new EdgeInsets.all(19.0)),
                        new OutLineButton("LOGIN", () => print('login tapped')),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Stack(
            children: [
              new Positioned(
                  child: new Center(
                    child: new Text(
                      "Don't have an account?",
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  bottom: 75.0,
                  left: (MediaQuery.of(context).size.width / 4),
                  right: MediaQuery.of(context).size.width / 4),
              new Positioned(
                // red box
                child: new Container(
                  child: new DefaultButton(
                      "SIGNUP", () => print('SIGNED UP tapped')),
                  decoration: new BoxDecoration(),
                ),
                bottom: 0.0,
                left: 0.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
