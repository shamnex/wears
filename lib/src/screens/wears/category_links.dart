import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';

class CategoryLink extends StatelessWidget {
  final AssetImage image;
  final String text;
  final Function onPressed;

  CategoryLink({this.text, this.image, this.onPressed});

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
                color: AppColors.primaryDark,,
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
                  Expanded(child: buildText(context)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildText(BuildContext context) {
    return MaterialButton(
        highlightColor: AppColors.primary.withOpacity(0.3),
        splashColor: AppColors.primary.withOpacity(0.8),
        elevation: 10.0,
        minWidth: double.infinity,
        height: MediaQuery.of(context).size.height,
        onPressed: onPressed,
        child: Stack(children: [
          Positioned(
            bottom: 20.0,
            child: RotatedBox(
              quarterTurns: -1,
              child: Container(
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.7),
                    offset: Offset(20.0, 0.0),
                  )
                ]),
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Antonio'),
                ),
              ),
            ),
          ),
        ]));
  }

  Widget buildText2(BuildContext context) {
    return Center(
      child: MaterialButton(
        highlightColor: AppColors.primary.withOpacity(0.3),
        splashColor: AppColors.primary.withOpacity(0.8),
        elevation: 10.0,
        minWidth: double.infinity,
        height: MediaQuery.of(context).size.height,
        onPressed: onPressed,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.7),
              offset: Offset(20.0, 0.0),
            )
          ]),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
                fontFamily: 'Antonio'),
          ),
        ),
      ),
    );
  }
}
