import 'dart:async';

import 'package:meta/meta.dart';
import 'package:wears/data/constants.dart';
import 'package:wears/src/models/items.dart';

class Category {
  final int id;
  final String title;
  final String image;
  final List<Items> subCategories;

  Category({
    @required this.id,
    @required this.title,
    @required this.image,
    @required this.subCategories,
  });

  static List<Category> getAllCategories() {
    var WearsImagaes;
    return [
      Category(
        id: 01,
        image: WearsImages.suit_bg,
        subCategories: [],
        title: "SUITS",
      ),
      Category(
        id: 01,
        image: WearsImages.shoe,
        subCategories: [],
        title: "shoe",
      ),
      Category(
        id: 01,
        image: WearsImages.tie,
        subCategories: [],
        title: "ACCESORIES",
      ),
      Category(
        id: 01,
        image: WearsImages.watch,
        subCategories: [],
        title: "WATCHES",
      ),
    ];
  }

  // static Future<Category> getCategoryByName(String title) {
  //   return Future.delayed(Duration(milliseconds: 1000), () {
  //     return getAllCategories().firstWhere(
  //         (category) => title.toLowerCase() == category.title.toLowerCase());
  //   });
  // }

  static Category getCategoryByName(String title) {
    return getAllCategories().firstWhere(
        (category) => title.toLowerCase() == category.title.toLowerCase());
  }
}
