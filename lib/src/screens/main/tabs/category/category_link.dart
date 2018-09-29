import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';

class CategoryLink extends StatelessWidget {
  final AssetImage image;
  final String text;
  final Function onPressed;
  final MainTitle title;

  CategoryLink(
      {@required this.text,
      @required this.image,
      @required this.onPressed,
      @required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                color: AppColors.primaryDark,
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
                    child: title,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
