import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nike/models/product_model.dart';
import '../repositories/product_repositories.dart';

class ProductController extends AsyncNotifier<List<ProductModel>> {
  final ProductRepositories _productRepositoreies = ProductRepositories();

  @override
  Future<List<ProductModel>> build() async {
    return await getAllProduct();
  }

  Future<List<ProductModel>> getAllProduct() async {
    final list = await _productRepositoreies.getAllProducts(page: 1, limit: 20);
    return list;
  }
}