import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';
import 'package:wears/src/widgets/main_title.dart';

class WearsSliderItem {
  final Widget title;
  final ImageProvider image;

  WearsSliderItem({this.title, this.image})
      : assert(title != null),
        assert(image != null);

  static List<WearsSliderItem> generate() {
    return [
      WearsSliderItem(
        image: AssetImage(WearsImages.suit4),
        title: WearsTitle(
          text: "WINTERSALES 50% OFF",
        ),
      ),
      WearsSliderItem(
        image: AssetImage(WearsImages.suit1),
        title: WearsTitle(
          text: "NEW IN",
        ),
      ),
      WearsSliderItem(
        image: AssetImage(WearsImages.suit2),
        title: WearsTitle(
          text: "WINTERSALES 50% OFF",
        ),
      ),
      WearsSliderItem(
        image: AssetImage(WearsImages.suit3),
        title: WearsTitle(
          text: "WINTERSALES 50% OFF",
        ),
      ),
    ];
  }
}
