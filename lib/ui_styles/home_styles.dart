import 'package:flutter/material.dart';

import 'gradient_overlay.dart';

class HomeLinkStyle extends StatelessWidget {
  final String _linkImage;
  final String _linkText;

  HomeLinkStyle(this._linkText,this._linkImage,);

  @override
  Widget build(BuildContext context) {
    return new InkWell(

 splashColor: Colors.black,
                  onTap: (){},      child: new Container(
        decoration: new BoxDecoration(),
        child: new Column(
          children: <Widget>[
            new Expanded(
              flex: 2,
              child: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  new Container(
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                      image: new AssetImage(_linkImage),
                      fit: BoxFit.cover,
                      repeat: ImageRepeat.repeat,
                      colorFilter: new ColorFilter.mode(
                          const Color(0xFF481300).withOpacity(0.4),
                          BlendMode.softLight),
                    )),
                  ),

                  new GradientOverlay(
                    <Color>[
                      const Color(0xFF481300).withOpacity(0.4),
                      const Color(0xFF000000).withOpacity(0.4)
                    ],
                  ),
            
                  new Column(children: <Widget>[
                    new Expanded(
                        child: new Center(
                      child: new Text(
                        _linkText,
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 27.0,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Avenir-Condensed'),
                      ),
                    ))
                  ]),

                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
