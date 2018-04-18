import 'package:flutter/material.dart';
import './pages/welcome_page.dart';
import 'pages/login_page_new.dart';

void main() {
  runApp(new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(
          fontFamily: 'Avenir', primaryColor: const Color(0xFF481300))));
}
