import 'package:flutter/material.dart';

import '../../../data/constants.dart';
import '../../common/gradient_overlay.dart';

class CategoryLink extends StatelessWidget {
  final String _linkImage;
  final String _linkText;
  final VoidCallback _onPressed;

  CategoryLink(this._linkText, this._linkImage, this._onPressed);

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
                  )),
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
                      highlightColor: AppColors.primary.withOpacity(0.3),
                      splashColor: AppColors.primary.withOpacity(0.8),
                      elevation: 10.0,
                      minWidth: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      onPressed: _onPressed,
                      child: new Container(
                        decoration: new BoxDecoration(boxShadow: [
                          new BoxShadow(
                            color: AppColors.primary.withOpacity(0.7),
                            offset: new Offset(20.0, 0.0),
                          )
                        ]),
                        child: new Text(
                          _linkText,
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 27.0,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
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
