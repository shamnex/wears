import 'package:flutter/material.dart';

class WearsSliderItem {
  final Widget title;
  final ImageProvider image;

  WearsSliderItem({this.title, this.image})
      : assert(title != null),
        assert(image != null);
}
