import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';
import 'package:wears/generic_widgets/slider/slider.dart';
import 'package:wears/generic_widgets/slider/sliderItems.dart';
import 'package:wears/src/screens/shop/tabs/category/category_app_bar.dart';
import 'package:wears/src/widgets/image_container.dart';
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
              child: SliverPersistentHeader(
                pinned: true,
                delegate: WearsSliverAppBar(
                  color: WearsColors.background,
                  expandedHeight: 160.0,
                  collapsedHeight: 80.0,
                  onScroll: (double offset) {},
                  onScrollToTop: (bool isAtTop) {},
                  bgImage: AssetImage(WearsImages.suit21),
                  colapsedTitle: Text("HOME"),
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
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        SizedBox.fromSize(
                          size: Size.fromHeight(screenHeight / 2.5),
                          child: WearsSlider(sliderItems: sliderItems),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox.fromSize(
                          size: Size.fromHeight(screenHeight / 2.5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: WearsImageContainer(
                                  size: Size.infinite,
                                  image: AssetImage(WearsImages.suit1),
                                  child: WearsTitle(text: "LATEST TRENDS"),
                                  alignChild: Alignment.bottomLeft,
                                ),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Expanded(
                                child: WearsImageContainer(
                                  size: Size.infinite,
                                  image: AssetImage(WearsImages.suit2),
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
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox.fromSize(
                          size: Size.fromHeight(screenHeight / 2.5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: WearsImageContainer(
                                  size: Size.infinite,
                                  image: AssetImage(WearsImages.suit1),
                                  child: WearsTitle(text: "LATEST TRENDS"),
                                  alignChild: Alignment.bottomLeft,
                                ),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Expanded(
                                child: WearsImageContainer(
                                  size: Size.infinite,
                                  image: AssetImage(WearsImages.suit2),
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
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
