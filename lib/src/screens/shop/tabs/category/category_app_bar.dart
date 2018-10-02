import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wears/data/constants.dart';
import 'package:wears/src/widgets/main_title.dart';

class CategoryAppBar implements SliverPersistentHeaderDelegate {
  final ImageProvider bgImage;
  final String title;
  Function(double) onScroll;
  Function(bool) onScrollToTop;
  final double collapsedHeight;
  final double expandedHeight;

  CategoryAppBar({
    @required this.bgImage,
    @required this.title,
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
            left: 25.0 * _fadeOut() ?? 25.0,
            right: 25.0 * _fadeOut() ?? 25.0,
            top: 50.0 * _fadeOut() ?? 50.0,
            bottom: 20.0 * _fadeOut() ?? 20.0,
          ),
          child: Hero(
            tag: "category/suits",
            child: Material(
              child: _buildBackgroundAndTitle(context),
            ),
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
          SizedBox(height: 10.0 * _fadeOut() ?? 0.0),
          Container(
            margin: EdgeInsets.all(20.0 * _fadeOut() ?? 20.0),
            child: AppBar(
              backgroundColor: Colors.transparent,
              leading: Hero(
                tag: "menuButton",
                child: CupertinoButton(
                  // color: Colors.white,

                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    // width: 30.0,
                    color: Colors.transparent,
                    // height: 30.0,
                    // margin:
                    //     EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
                    child: Stack(
                      children: <Widget>[
                        Transform.rotate(
                          alignment: Alignment.centerLeft,
                          angle: -0.7,
                          child: Container(
                            height: 2.5,
                            width: 15.0,
                            color: Colors.white,
                          ),
                        ),
                        Transform.rotate(
                          alignment: Alignment.centerLeft,
                          angle: 0.7,
                          child: Container(
                            height: 2.5,
                            width: 15.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              elevation: 0.0,
              actions: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Hero(
                        tag: "searchButton",
                        child: Icon(
                          Icons.search,
                          size: 25.0,
                          color: Colors.white
                        ),
                      ),
                    )),
              ],
              centerTitle: true,
              title: Transform.translate(
                offset: Offset(0.0, 100.0 * _fadeOut()),
                child: Opacity(
                  opacity: 1.0,
                  child: WearsTitle(text: title),
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
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                color: WearsColors.primaryDark,
              ),
              Opacity(
                opacity: 0.4,
                child: Container(
                  padding: EdgeInsets.all(25.0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: bgImage,
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Opacity(
                        opacity: _fadeOut(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: WearsTitle(text: title),
                        ),
                      ),
                    ),
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
