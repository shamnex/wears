import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:wears/data/constants.dart';

class CategoryDetailsScreen extends StatelessWidget {
  CategoryDetailsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      toolbarOpacity: 1.0,
      elevation: .0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: Text(
        "Home",
        style: TextStyle(
            fontFamily: 'Antonio',
            fontWeight: FontWeight.w900,
            fontSize: 22.0,
            color: AppColors.primary),
      ),
    );
  }
}

class CategoryHeader implements SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
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
                    image: AssetImage('assets/imgs/suits_bg.jpg'),
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    child: _buildText(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
    // TODO: implement build
  }

  // TODO: implement maxExtent
  @override
  double get maxExtent => null;

  // TODO: implement minExtent
  @override
  double get minExtent => null;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
  }

  // TODO: implement snapConfiguration
  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  _buildText(BuildContext context) {}
}
