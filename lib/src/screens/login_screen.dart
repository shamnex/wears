import 'package:flutter/material.dart';
import '../widgets/buttons.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(35.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              alignment: Alignment(-2.0, 4.0),
              colorFilter: new ColorFilter.mode(
                Colors.white.withOpacity(0.03),
                BlendMode.dstATop,
              ),
              image: AssetImage("assets/graphics/logo_color.png"),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/graphics/logo_color.png"),
              buildUsername(context),
              buildPassword(context),
              DefaultButton("SIGN IN", 10.0, () {}),
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

  Widget buildUsername(context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),

      decoration: BoxDecoration(
        // border: Border.all(color: Colors.red, width: 0.5),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0.0,
              offset: Offset.zero,
              blurRadius: 18.0),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 16.0,
            ),
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
            hintText: 'Username',
            prefixIcon: Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.person,
                color: Theme.of(context).primaryColor.withOpacity(0.8),
              ),
            )),
      ),
    );
  }

  Widget buildPassword(context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 0.0,
          offset: Offset.zero,
          blurRadius: 18.0,
        ),
      ]),
      child: TextField(
        // onChanged: ,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 24.0,
            horizontal: 16.0,
          ),
          errorText: "",
          border: InputBorder.none,

          filled: true,
          fillColor: Colors.white,
          hintText: 'Password',
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.lock,
              color: Theme.of(context).primaryColor.withOpacity(0.8),
            ),
          ),
        ),
      ),
    );
  }
}
