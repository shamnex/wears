import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Stack(
       fit: StackFit.expand,
       children: [
     
       new DecoratedBox(
    decoration: new BoxDecoration(
      image: new DecorationImage(
      fit: BoxFit.cover,
      image: new AssetImage("assets/imgs/landing_bg.jpg"
      ),
      // ...
    ),
  )
        ),
        new DecoratedBox(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: const Alignment(0.0, 0.0),
              end: const Alignment(0.0, 1.0),
              colors: <Color>[
                const Color(0x481300).withOpacity(0.75),
                 const Color(0x000000).withOpacity(0.86)],
            ),
          ),
        ),
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Image.asset("assets/graphics/logo.png"),

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
    );
  }
}
