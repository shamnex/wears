import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';

class WearsImageContainer extends StatelessWidget {
  final ImageProvider image;
  final Widget child;
  final Size size;
  final Alignment alignChild;
  const WearsImageContainer({
    Key key,
    @required this.size,
    this.image,
    this.child,
    this.alignChild,
  })  : assert(size != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: WearsColors.primaryDark2,
          ),
          Opacity(
            opacity: 0.4,
            child: Container(
              padding: EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
                  image: image ?? AssetImage('assets/imgs/suits_bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // BackdropFilter(
          //   filter: ImageFilter.blur(
          //     sigmaX: 2.0,
          //     sigmaY: 2.0,
          //   ),
          //   child: Container(
          //     color: Colors.transparent,
          //   ),
          // ),
          Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: alignChild ?? Alignment.center,
                  child: Opacity(
                    opacity: 1.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: child,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
