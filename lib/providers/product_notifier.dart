import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nike/models/product_model.dart';
import '../repositories/product_repositories.dart';

class ProductController extends AsyncNotifier<List<ProductModel>> {
  final ProductRepositories _productRepositoreies = ProductRepositories();

  @override
  Future<List<ProductModel>> build() async {
    return await getAllProduct(page: 1, limit: 10);
  }

  Future<List<ProductModel>> getAllProduct({required int page, required int limit}) async {
    final list = await _productRepositoreies.getAllProducts(page: 1, limit: 10);
    return list;
  }

  Future<void> nextProduct() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await getAllProduct(page: 2, limit: 10);
    });
  }
}