import 'package:hive/hive.dart';

part 'cart_hive.g.dart';

@HiveType(typeId: 1)
class CartHive extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  double? price;

  @HiveField(3)
  String? image;

  @HiveField(4)
  int quantity;

  CartHive({this.id, this.title, this.price, this.image, this.quantity = 1});
}