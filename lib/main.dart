import 'package:flutter/material.dart';
import './pages/welcome_page.dart';
// import 'pages/login_page.dart';

void main() {
  runApp(
    new MaterialApp(
      home: new WelcomePage(),
      theme: new ThemeData(
        fontFamily: 'Avenir'
      )
    )
  );
}