import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';
import 'package:wears/generic_widgets/slider/sliderItems.dart';

class WearsSlider extends StatefulWidget {
  const WearsSlider({
    Key key,
    @required this.sliderItems,
    this.autoPlay,
  }) : super(key: key);

  final List<WearsSliderItem> sliderItems;
  final bool autoPlay;

  @override
  WearsSliderState createState() {
    return new WearsSliderState();
  }
}

class WearsSliderState extends State<WearsSlider> {
  PageController _pageViewController;
  int _currentSlide;

  @override
  void initState() {
    _pageViewController = PageController(
      viewportFraction: 0.95,
    );
    _currentSlide = 0;
    // TODO: implement initState
    super.initState();
    // autoPlay();
  }

  autoPlay() {
    Timer.periodic(Duration(seconds: 4), (_) {
      if (_currentSlide == widget.sliderItems.length - 1) {
        _pageViewController.jumpToPage(0);
      }
      _pageViewController.nextPage(
          curve: Curves.elasticIn, duration: Duration(milliseconds: 300));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageView.builder(
          controller: _pageViewController,
          itemCount: widget.sliderItems.length,
          onPageChanged: (index) {
            setState(() {
              _currentSlide = index;
            });
          },
          itemBuilder: (BuildContext context, int index) {
            final slide = widget.sliderItems[_currentSlide];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: slide.image,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    height: double.infinity,
                    child: slide.title,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.0)
                        ])),
                    width: double.infinity,
                  ),
                ],
              ),
            );
          },
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10.0, right: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: _buildIndicator(),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> _ = [];
    widget.sliderItems.asMap().forEach((index, item) {
      _.add(AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: index == _currentSlide ? 12.0 : 9.0,
        width: index == _currentSlide ? 12.0 : 9.0,
        margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: index == _currentSlide ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
              color: Colors.white, style: BorderStyle.solid, width: 2.0),
        ),
      ));
    });

    return _;
  }
}
