import 'package:flutter/material.dart';
import 'package:wears/generic_widgets/slider/sliderItems.dart';
import 'package:wears/src/widgets/image_container.dart';
import 'package:wears/src/widgets/main_title.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }

  final List<WearsSliderItem> sliderItems = [
    WearsSliderItem(
      image: AssetImage('assets/imgs/suits_bg.jpg'),
      title: WearsTitle(
        text: "WINTERSALES 50% OFF",
      ),
    ),
    WearsSliderItem(
      image: AssetImage('assets/imgs/suits4.jpg'),
      title: WearsTitle(
        text: "NEW IN",
      ),
    ),
    WearsSliderItem(
      image: AssetImage('assets/imgs/suits3.png'),
      title: WearsTitle(
        text: "WINTERSALES 50% OFF",
      ),
    ),
    WearsSliderItem(
      image: AssetImage('assets/imgs/suits2.png'),
      title: WearsTitle(
        text: "WINTERSALES 50% OFF",
      ),
    ),
  ];
}

class HomeScreenState extends State<HomeScreen> {
  PageController _pageViewController;

  initState() {
    super.initState();
    _pageViewController = PageController(viewportFraction: 0.95);
  }

  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: SafeArea(
        child: Builder(
          builder: (BuildContext context) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        SizedBox(
                          height: 60.0,
                        ),
                        SizedBox.fromSize(
                          size: Size.fromHeight(screenHeight / 2.5),
                          child: Stack(
                            children: <Widget>[
                              PageView.builder(
                                controller: _pageViewController,
                                itemCount: widget.sliderItems.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final slide = widget.sliderItems[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: WearsImageContainer(
                                        image: slide.image,
                                        size: Size.fromHeight(200.0),
                                        child: slide.title),
                                  );
                                },
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: 10.0,
                                        width: 10.0,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.white,
                                                style: BorderStyle.solid)),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(10.0),
                                        height: 10.0,
                                        width: 10.0,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.white,
                                                style: BorderStyle.solid)),
                                      ),
                                      Container(
                                        height: 10.0,
                                        width: 10.0,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.white,
                                                style: BorderStyle.solid)),
                                      ),
                                    ],
                                  ),
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
