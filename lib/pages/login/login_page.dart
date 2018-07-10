import 'package:flutter/material.dart';
import 'package:wears/ui/buttons.dart';
import 'package:wears/ui/forms.dart';

import '../mainpage/main_page.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final Color _primaryColor = const Color(0xFF481300);
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
          decoration: BoxDecoration(
            color: const Color(0xffe6e6e6),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/graphics/logo_color.png"),
              Form(
                child: Theme(
                  data: ThemeData(
                      primaryColor: _primaryColor,
                      primaryIconTheme: IconThemeData(color: _primaryColor)),
                  child: Column(
                    children: <Widget>[
                      InputField("Username", Icons.person, false),
                      InputField("Password", Icons.lock, true),
                      DefaultButton(
                          "SIGN IN",
                          10.0,
                          () => Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext build) => MainPage())))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: -16.0,
          child: Column(children: <Widget>[
            Text("Don't have an account? "),
            WhiteButton('SIGN UP', () {})
          ]),
        )
      ],
    ));
  }
}
