import 'package:flutter/material.dart';
import 'ui/mainpage/main_page.dart';

void main() {
  runApp(new MaterialApp(
      home: new MainPage(),
      theme: new ThemeData(
          fontFamily: 'Avenir', primaryColor: const Color(0xFF481300))));
}
