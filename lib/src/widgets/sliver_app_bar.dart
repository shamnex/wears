import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wears/data/constants.dart';
import 'package:wears/src/widgets/image_container.dart';

class WearsSliverAppBar implements SliverPersistentHeaderDelegate {
  final ImageProvider bgImage;
  final Widget expandedTitle;
  final Color color;
  final bool showElevation;
  final Widget leading;
  final List<Widget> actions;
  final Widget colapsedTitle;
  Function(double) onScroll;
  Function(bool) onScrollToTop;
  final double collapsedHeight;
  final double expandedHeight;

  WearsSliverAppBar({
    @required this.bgImage,
    @required this.expandedTitle,
    @required this.colapsedTitle,
    this.actions,
    this.showElevation = false,
    this.leading,
    this.color,
    this.onScroll,
    this.onScrollToTop,
    @required this.collapsedHeight,
    @required this.expandedHeight,
  })  : maxExtent = expandedHeight,
        minExtent = collapsedHeight;

  @override
  double maxExtent;
  @override
  double minExtent;

  Function _fadeOut;
  Function _fadeIn;

  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  // TODO: implement snapConfiguration
  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    onScroll(shrinkOffset);
    onScrollToTop(
        (expandedHeight - collapsedHeight).toInt() == shrinkOffset.toInt());

    final double screenHeight = MediaQuery.of(context).size.height;
    //IF SCROLLED TO TOP
    bool _isScrolledToTop() =>
        (maxExtent - minExtent).toInt() == shrinkOffset.toInt();

    _fadeOut = () {
      double _opacity = -(shrinkOffset / (screenHeight / 4.55)) + 1.0;
      if (_isScrolledToTop()) return 0.0;
      return (_opacity < 0 ? 0.0 : _opacity.toDouble()) ?? 1.0;
    };

    _fadeIn = () {
      if (shrinkOffset < screenHeight / 6.0) return 0.0;
      double _opacity = shrinkOffset / (screenHeight / 3.7);
      return (_opacity > 1 ? 1.0 : _opacity.toDouble()) ?? 1.0;
    };

    //CALLBACKs
    onScroll(shrinkOffset);
    onScrollToTop(_isScrolledToTop());

    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: <Widget>[
        _buildNavBar(context, _isScrolledToTop()),
      ],
    );
    // TODO: implement build
  }

  Widget _buildNavBar(BuildContext context, bool isAtTop) {
    return Column(
      children: <Widget>[
        Container(
          child: AppBar(
            
            backgroundColor: color ?? Colors.transparent,
            leading: leading,
            elevation: showElevation? (isAtTop?  30.0: 0.0): 0.0,
            actions: actions,
            centerTitle: true,
            title: Opacity(
              opacity: 1.0,
              child: colapsedTitle,
            ),
          ),
        ),
      ],
    );
  }

  // Widget _buildBackgroundAndTitle(context) {
  //   return Column(
  //     children: <Widget>[
  //       Expanded(
  //         flex: 2,
  //         child: Align(
  //           alignment: Alignment.bottomCenter,
  //           child: Opacity(
  //             opacity: _fadeOut(),
  //             child: colapsedTitle,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
