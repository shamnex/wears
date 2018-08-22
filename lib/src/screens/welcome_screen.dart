import 'package:flutter/material.dart';
import '../widgets/gradient_overlay.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(fit: StackFit.expand, children: [
        buildBackground(),
        buildGradient(),
        buildBrand(),
      ]),
    );
  }

//CREATES THE BACKGROUND IMAGES
  Widget buildBackground() {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              const Color(0xFF481300).withOpacity(1.0), BlendMode.softLight),
          fit: BoxFit.cover,
          image: AssetImage("assets/imgs/landing_bg3.png"),
        ),
      ),
    );
  }

//CREATES THE GRADIENT OVERLAY
  Widget buildGradient() {
    return GradientOverlay(
      colors: [
        const Color(0xFF481300).withOpacity(0.45),
        const Color(0xFF000000).withOpacity(1.0),
      ],
    );
  }

//CREATES THE FOREGROUND ELEMENTS I.E LOGOS AND
  Widget buildBrand() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset("assets/graphics/logo.png"),
        Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
        Text(
          "WEARS",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Avenir",
              fontSize: 42.0,
              fontWeight: FontWeight.w900),
        ),
        Text("FOR MEN THEM",
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.white,
              letterSpacing: 6.0,
              fontFamily: "Avenir",
            ))
      ],
    );
  }
}
