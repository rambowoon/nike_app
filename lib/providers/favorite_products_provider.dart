import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

import 'favorite_products_notifier.dart';

final favoriteProductsProvider =
StateNotifierProvider<FavoriteProductsNotifier, Set<int>>((ref) {
  final box = Hive.box('favorite_products');

  return FavoriteProductsNotifier(
    Set<int>.from(box.get('favorite_products', defaultValue: [])),
  );
});