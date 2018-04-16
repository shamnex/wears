import 'package:flutter/material.dart';
import '../ui_styles/gradient_overlay.dart';

class WelcomePage extends StatefulWidget {
  @override
  WelcomePageState createState() => new WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new InkWell(
        onTap: ()=> print("go to next page"),
        child: new Stack(
          fit: StackFit.expand, 
          children: [
          new DecoratedBox(
              decoration: new BoxDecoration(
            image: new DecorationImage(
              fit: BoxFit.cover,
              image: new AssetImage("assets/imgs/landing_bg.jpg"),
              // ...
            ),
          )),
          new GradientOverlay( <Color>[
                const Color(0x481300).withOpacity(0.75),
                const Color(0x000000).withOpacity(0.86)
              ],),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset("assets/graphics/logo.png"),
              new Padding(padding: new EdgeInsets.symmetric(vertical: 4.0)),
              new Text(
                "WEARS",
                style: new TextStyle(
                    color: Colors.white,
                    fontFamily: "Avenir",
                    fontSize: 42.0,
                    fontWeight: FontWeight.w900),
              ),
              new Text("FOR MEN THEM",
                  style: new TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                    letterSpacing: 4.0,
                    fontFamily: "Avenir",
                  ))
            ],
          ),
        ]),
      ),
    );
  }
}