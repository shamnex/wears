import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';
import 'package:wears/src/screens/shop/tabs/category/category_header.dart';
import 'package:wears/src/widgets/buttons.dart';
import 'package:wears/src/widgets/image_container.dart';
import 'package:wears/src/widgets/item_card.dart';
import 'package:wears/src/widgets/main_title.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen();

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;

    return Material(
      color: WearsColors.background,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: SliverPersistentHeader(
                pinned: true,
                delegate: CategoryHeader(
                  expandedHeight: _screenSize.height / 2.5,
                  collapsedHeight: 80.0 + 25,
                  onScroll: (double offset) {},
                  onScrollToTop: (bool isAtTop) {},
                  bgImage: AssetImage(WearsImages.suit_bg),
                  title: "SUITS",
                ),
              ),
            ),
          ];
        },
        body: Builder(
          builder: (BuildContext context) {
            return CustomScrollView(
              slivers: <Widget>[
                new SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                _buildSubCategory(),
                _buildRecentlyViewed(),
                _buildFooter(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          SizedBox(
            height: 20.0,
          ),
          WearsImageContainer(
            size: Size.fromHeight(200.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                WearsTitle(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontFamily: 'Antonio'),
                  text: "Build Your OWN Suit".toUpperCase(),
                ),
                GestureDetector(
                    child: Text(
                  "Get Started",
                  style: TextStyle(color: Colors.white),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentlyViewed() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SizedBox.fromSize(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: <Widget>[
                      Text(
                        "Recent Viewed",
                        style: TextStyle(
                          fontFamily: "Antonio",
                          fontSize: 16.0,
                          color: WearsColors.text,
                        ),
                      ),
                      Text(
                        "".padLeft(10),
                        style: TextStyle(fontFamily: "Raleway", fontSize: 12.0),
                      ),
                    ],
                  ),
                  Text(
                    "View All",
                    style: TextStyle(fontFamily: "Raleway", fontSize: 12.0),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          SizedBox.fromSize(
            size: Size.fromHeight(280.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemCard();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubCategory() {
    return SliverFixedExtentList(
      itemExtent: 84.0,
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          color: Colors.white,
          width: double.infinity,
          height: 64.0,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: SizedBox.expand(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Image.asset(
                    WearsImages.suit1,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Sub-Category Name",
                          style: TextStyle(
                            fontFamily: "Antonio",
                            fontSize: 16.0,
                            color: WearsColors.text,
                          ),
                        ),
                        Text(
                          " (10 Items)   >",
                          style:
                              TextStyle(fontFamily: "Raleway", fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }, childCount: 4),
    );
  }
}
