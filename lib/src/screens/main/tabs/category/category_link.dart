import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';
import 'package:wears/src/widgets/main_title.dart';

class CategoryLink extends StatelessWidget {
  final AssetImage image;
  final Function onPressed;
  final WearsTitle title;
  final Alignment textAlignment;

  CategoryLink(
      {@required this.image,
      @required this.onPressed,
      @required this.title,
     this.textAlignment});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: onPressed,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                      color: WearsColors.primaryDark,
                    ),
                    Opacity(
                      opacity: 0.4,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: image,
                          fit: BoxFit.cover,
                        )),
                      ),
                    ),
                    Flex(
                      direction: Axis.vertical,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            alignment: textAlignment ?? Alignment.center,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: title,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
