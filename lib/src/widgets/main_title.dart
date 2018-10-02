import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';

class WearsTitle extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final bool rotate;

  WearsTitle(
      {this.onPressed,
      @required this.text,
      this.textStyle,
      this.rotate = false});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RotatedBox(
          quarterTurns: rotate ? -1 : 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: WearsColors.primary.withOpacity(0.7),
                  offset: Offset(20.0, 0.0),
                )
              ]),
              child: Text(
                text,
                style: 
                    TextStyle(
                        color: Colors.white ,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Antonio'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
