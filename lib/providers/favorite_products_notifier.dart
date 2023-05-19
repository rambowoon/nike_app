import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class FavoriteProductsNotifier extends StateNotifier<Set<int>> {
  FavoriteProductsNotifier(Set<int> state) : super(state);

  void toggle(int productId) {
    if (state.contains(productId)) {
      state = state.difference({productId});
    } else {
      state = state.union({productId});
    }

    final box = Hive.box('favorite_products');
    box.put('favorite_products', state.toList());
  }
}