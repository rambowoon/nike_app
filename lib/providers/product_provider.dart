import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_model.dart';
import '../repositories/product_repositories.dart';

class ProductState{
  final List<ProductModel>? listProduct;
  final bool isLoaded;
  ProductState({this.listProduct, this.isLoaded=false});
  ProductState copyWith({List<ProductModel>? listProduct, bool? isLoaded}){
    return ProductState(
        listProduct: listProduct ?? this.listProduct,
        isLoaded: isLoaded ?? this.isLoaded
    );
  }
}

final ProductProvider = StateNotifierProvider<ProductController,  ProductState>((ref) {
  return ProductController();
});

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
