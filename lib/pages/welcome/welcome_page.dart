import 'package:flutter/material.dart';
import 'package:wears/ui/gradient_overlay.dart';
import '../login/login_page.dart';

class WelcomePage extends StatefulWidget {
  @override
  WelcomePageState createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext build) => LoginPage()),
            (Route route) => route == null),
        // onTap: () => Navigator.of(context).push( MaterialPageRoute(
        //     builder: (BuildContext context) =>  LoginPage())),

        child: Stack(fit: StackFit.expand, children: [
          DecoratedBox(
              decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  const Color(0xFF481300).withOpacity(1.0),
                  BlendMode.softLight),
              fit: BoxFit.cover,
              image: AssetImage("assets/imgs/landing_bg3.png"),

              // ...
            ),
          )),
          GradientOverlay(
            <Color>[
              const Color(0xFF481300).withOpacity(0.25),
              const Color(0xFF000000).withOpacity(0.26)
            ],
          ),
          Column(
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
