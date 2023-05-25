import 'package:hive/hive.dart';

part 'favorite_product_hive.g.dart';

@HiveType(typeId: 3)
class FavoriteProductHive extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  double? price;

  @HiveField(3)
  String? image;

  FavoriteProductHive({this.id, this.title, this.price, this.image});
}