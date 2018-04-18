import 'package:flutter/material.dart';

import '../ui_styles/buttons.dart';
import '../ui_styles/forms.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final Color _primaryColor = const Color(0xFF481300);
  @override
  Widget build(BuildContext context) {
    return new Material(
        child: new Stack(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
          decoration: new BoxDecoration(
            color: const Color(0xffe6e6e6),
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset("assets/graphics/logo_color.png"),
              new Form(
                child: new Theme(
                  data: new ThemeData(
                      primaryColor: _primaryColor,
                      primaryIconTheme:
                          new IconThemeData(color: _primaryColor)),
                  child: new Column(
                    children: <Widget>[
                      new InputField("Username", Icons.person, false),
                      new InputField("Password", Icons.lock, true),
                      new DefaultButton("SIGN IN", () => print('Hello'))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),

        new Positioned(
          bottom: -16.0,
          child: new WhiteButton('Sign Up', (){}),
        )
      ],
    ));
  }
}
