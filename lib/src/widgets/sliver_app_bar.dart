import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wears/data/constants.dart';
import 'package:wears/src/widgets/image_container.dart';

class WearsSliverAppBar implements SliverPersistentHeaderDelegate {
  final ImageProvider bgImage;
  final Widget expandedTitle;
  final Color color;
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
        Padding(
          padding: EdgeInsets.only(
            left: 20.0 * _fadeOut() ?? 20.0,
            right: 20.0 * _fadeOut() ?? 20.0,
            top: 50.0 * _fadeOut() ?? 50.0,
            bottom: 20.0 * _fadeOut() ?? 20.0,
          ),
          child: Material(
            child: _buildBackgroundAndTitle(context),
          ),
        ),
        _buildNavBar(context),
      ],
    );
    // TODO: implement build
  }

  Widget _buildNavBar(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          maxExtent > 80.0
              ? Container()
              : SizedBox(height: 10.0 * _fadeOut() ?? 0.0),
          Container(
            margin: EdgeInsets.all(
              maxExtent > 80.0 ? 0.0 : (20.0 * _fadeOut() ?? 20.0),
            ),
            child: AppBar(
              backgroundColor: color ?? Colors.transparent,
              leading: leading,
              elevation: 0.0,
              actions: actions,
              centerTitle: true,
              title: Transform.translate(
                offset: Offset(0.0, 80.0 * _fadeOut()),
                child: Opacity(
                  opacity: 1.0,
                  child: colapsedTitle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundAndTitle(context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Opacity(
            opacity: _fadeOut(),
            child: colapsedTitle,
          ),
        ),
      ],
    );
  }
}
