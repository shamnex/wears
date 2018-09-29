import 'package:wears/src/models/items.dart';

class Category {
  final String id;
  final String title;
  final String image;
  final List<Items> subCategories;

  Category({
    this.id,
    this.title,
    this.image,
    this.subCategories,
  });
}
