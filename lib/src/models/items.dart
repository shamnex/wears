import 'package:wears/src/models/category.dart';

class Items {
  final String name;
  final String price;
  final String isFavorite;
  final Category category;
  final List<String> images;

  Items({
    this.name,
    this.price,
    this.isFavorite,
    this.category,
    this.images,
  });
}
