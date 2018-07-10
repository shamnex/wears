import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';

import 'package:wears/ui/gradient_overlay.dart';

class CategoryLink extends StatelessWidget {
  final String _linkImage;
  final String _linkText;
  final VoidCallback _onPressed;

  CategoryLink(this._linkText, this._linkImage, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(_linkImage),
                    fit: BoxFit.cover,
                    repeat: ImageRepeat.repeat,
                    colorFilter: ColorFilter.mode(
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
                Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                        child: Center(
                            child: MaterialButton(
                      highlightColor: AppColors.primary.withOpacity(0.3),
                      splashColor: AppColors.primary.withOpacity(0.8),
                      elevation: 10.0,
                      minWidth: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      onPressed: _onPressed,
                      child: Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.7),
                            offset: Offset(20.0, 0.0),
                          )
                        ]),
                        child: Text(
                          _linkText,
                          style: TextStyle(
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
