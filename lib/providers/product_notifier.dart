import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nike/providers/product_provider.dart';

import '../repositories/product_repositories.dart';

class ProductController extends StateNotifier<ProductState> {
  final ProductRepositories _productRepositoreies = ProductRepositories();
  // final List<ProductModel>? listProduct;
  ProductController() : super(ProductState(listProduct: []));


  getAllProduct() async {
    final list = await _productRepositoreies.getAllProducts();
    state = state.copyWith(listProduct: list, isLoaded: true);
    return Future(() => list);
  }
}