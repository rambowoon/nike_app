import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nike/models/product_model.dart';
import 'package:nike/providers/product_notifier.dart';

final ProductProvider = AsyncNotifierProvider<ProductController,  List<ProductModel>>(() {
  return ProductController();
});
