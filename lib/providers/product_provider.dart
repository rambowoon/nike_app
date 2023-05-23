import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nike/providers/product_notifier.dart';
import '../models/product_model.dart';

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
