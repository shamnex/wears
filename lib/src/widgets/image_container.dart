import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';
import 'package:wears/src/widgets/gradient_overlay.dart';

class WearsImageContainer extends StatelessWidget {
  final ImageProvider image;
  final Widget child;
  final Size size;
  final bool dark;
  final BlendMode blendMode;
  final Alignment alignChild;
  const WearsImageContainer({
    Key key,
    @required this.size,
    this.image,
    this.dark = true,
    this.child,
    this.blendMode,
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

          GradientOverlay(colors: [
                    WearsColors.primaryDark,
                   WearsColors.primaryDark,
          ]),
          Opacity(
            opacity: dark? 0.4: 1.0,
            child: Container(
              padding: EdgeInsets.all(25.0),
              decoration: BoxDecoration(
          
                image: DecorationImage(
                  // colorFilter: ColorFilter.mode(
                  //   WearsColors.background,
                  //   BlendMode.color,
                  // ),
                  image: image ?? AssetImage(WearsImages.suit_bg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
          ),

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
