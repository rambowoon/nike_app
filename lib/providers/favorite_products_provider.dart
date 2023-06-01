import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_model.dart';
import 'favorite_products_notifier.dart';

final favoriteProvider = AsyncNotifierProvider<FavoriteNotifier, Set<int>>(() {
  return FavoriteNotifier();
});

final favoriteProductsProvider = AsyncNotifierProvider<FavoriteProductsNotifier,  List<ProductModel>>(() {
  return FavoriteProductsNotifier();
});