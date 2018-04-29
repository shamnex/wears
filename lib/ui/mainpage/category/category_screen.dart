import 'package:flutter/material.dart';
import '../common/screen.dart';
import 'category.dart';

final categoryScreen = new Screen(
  title: "",
  contenBuilder: (BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        border: new Border(),
      ),
      child: new Container(
        child: new Category('assets/imgs/landing_bg3.png', "SUITS" ),
      ) 
    );
    
  }
);