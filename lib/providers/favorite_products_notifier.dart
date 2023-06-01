import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:nike/models/product_model.dart';
import 'package:nike/providers/favorite_products_provider.dart';
import 'package:nike/providers/product_provider.dart';

class FavoriteNotifier extends AsyncNotifier<Set<int>> {
  @override
  Future<Set<int>> build() async {
    return _fetchFavorite();
  }

  Future<Set<int>> _fetchFavorite() async {
    final _favoriteBox = Hive.box('favorite_products');
    final Set<int> favoriteProducts = await Set<int>.from(_favoriteBox.get('favorite_products', defaultValue: []));
    return  favoriteProducts;
  }

  Future<void> toggle(int productId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final Set<int> favoriteSet;
      if (state.value!.contains(productId)) {
        favoriteSet = state.value!.difference({productId});
      } else {
        favoriteSet = state.value!.union({productId});
      }
      final box = Hive.box('favorite_products');
      await box.put('favorite_products', favoriteSet.toList());
      return _fetchFavorite();
    });

  }
}

class FavoriteProductsNotifier extends AsyncNotifier<List<ProductModel>> {
  @override
  Future<List<ProductModel>> build() async {
    return _getAllProduct();
  }

  Future<List<ProductModel>> _getAllProduct() async {
    final List<ProductModel> listFavoriteProduct = [];
    final listProduct = ref.watch(ProductProvider).value;
    final favorite = ref.watch(favoriteProvider).value;
    if(listProduct != null && favorite != null) {
      for (var item in listProduct) {
        if (favorite.contains(item.id)) {
          listFavoriteProduct.add(item);
        }
      }
    }
    return await listFavoriteProduct;
  }
}