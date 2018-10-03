import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';
import 'package:wears/generic_widgets/slider/slider.dart';
import 'package:wears/generic_widgets/slider/sliderItems.dart';
import 'package:wears/src/widgets/image_container.dart';
import 'package:wears/src/widgets/item_card.dart';
import 'package:wears/src/widgets/main_title.dart';
import 'package:wears/src/widgets/sliver_app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  final List<WearsSliderItem> sliderItems = WearsSliderItem.generate();

  initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Material(
      color: WearsColors.background,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: _buildAppBar(),
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
                _buildSlider(screenHeight),
                _buildRow2(screenHeight),
                _buildHorizontalListItems(screenHeight),
                _buildMagazine(screenHeight),
                SliverPadding(
                  padding: EdgeInsets.only(top: 60.0),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverPersistentHeader(
        pinned: true,
        delegate: WearsSliverAppBar(
          color: WearsColors.background,
          expandedHeight: 81.0,
          collapsedHeight: 80.0,
          showElevation: true,
          onScroll: (double offset) {},
          onScrollToTop: (bool isAtTop) {},
          bgImage: AssetImage(WearsImages.suit21),
          colapsedTitle: Text(
            "Home",
            style: TextStyle(
                fontFamily: 'Antonio',
                fontWeight: FontWeight.w900,
                fontSize: 22.0,
                color: WearsColors.primary),
          ),
          expandedTitle: null,
        ));
  }

  Widget _buildSlider(double screenHeight) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 0.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            SizedBox.fromSize(
              size: Size.fromHeight(screenHeight / 1.8),
              child: WearsSlider(sliderItems: sliderItems),
            ),
          ],
        ),
      ),
    );
  }

  _buildRow2(screenHeight) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            SizedBox(
              height: 20.0,
            ),
            SizedBox.fromSize(
              size: Size.fromHeight(screenHeight / 2.5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: WearsImageContainer(
                      size: Size.infinite,
                      dark: false,
                      image: AssetImage(WearsImages.suit19),
                      child: WearsTitle(text: "LATEST TRENDS"),
                      alignChild: Alignment.bottomLeft,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: WearsImageContainer(
                      size: Size.infinite,
                      dark: false,
                      image: AssetImage(WearsImages.suit14),
                      child: WearsTitle(text: "BEST SELLERS"),
                      alignChild: Alignment.bottomLeft,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildMagazine(screenHeight) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            SizedBox(
              height: 20.0,
            ),
            SizedBox.fromSize(
              size: Size.fromHeight(screenHeight / 2.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: WearsImageContainer(
                      size: Size.infinite,
                      child: Container(
                        width: double.infinity,
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  WearsGraphics.logo_white,
                                  height: 80.0,
                                ),
                                Column(children: <Widget>[
                                  WearsTitle(text: "WEARS MAGIC"),
                                  Text(
                                    "Fine Boy Tips",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ]),
                              ],
                            ),
                          ],
                        ),
                      ),
                      image: AssetImage(WearsImages.suit1),
                      alignChild: Alignment.center,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

   _buildRow1(screenHeight) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            SizedBox(
              height: 20.0,
            ),
            SizedBox.fromSize(
              size: Size.fromHeight(screenHeight / 4.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: WearsImageContainer(
                      size: Size.infinite,
                      image: AssetImage(WearsImages.suit1),
                      alignChild: Alignment.bottomLeft,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 60.0,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        WearsTitle(text: "CLASSEIC"),
                        Text("48 items"),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalListItems(double screenHeight) {
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
            size: Size.fromHeight(245.0),
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
}
