import 'package:flutter/material.dart';
import './pages/welcome_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(new MaterialApp(
      home: new HomePage(),
      theme: new ThemeData(
          fontFamily: 'Avenir', primaryColor: const Color(0xFF481300))));
}
