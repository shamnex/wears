import 'package:flutter/material.dart';

import '../../common/gradient_overlay.dart';

class HomeLink extends StatelessWidget {
  final String _linkImage;
  final String _linkText;
  final Color _primaryColor = const Color(0xFF481300);

  HomeLink(
    this._linkText,
    this._linkImage,
  );

  @override
  Widget build(BuildContext context) {
    return new Container(
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
                  )
                  ),
                ),
                new GradientOverlay(
                  <Color>[
                    const Color(0xFF481300).withOpacity(0.4),
                    const Color(0xFF000000).withOpacity(0.4)
                  ],
                ),
                new Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    new Expanded(
                        child: new Center(
                            child: new MaterialButton(
                      highlightColor: _primaryColor.withOpacity(0.3),
                      splashColor: _primaryColor.withOpacity(0.8),
                      elevation: 10.0,
                      minWidth: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      onPressed: () {},
                      child: new Container(
                        decoration: new BoxDecoration(boxShadow: [
                          new BoxShadow(
                            color: _primaryColor.withOpacity(0.7),
                            offset: new Offset(20.0, 0.0),
                          )
                        ]),
                        child: new Text(
                          _linkText,
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 27.0,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Avenir-Condensed'),
                        ),
                      ),
                    ))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
