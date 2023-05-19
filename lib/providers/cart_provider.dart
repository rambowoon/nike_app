import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../adapters/cart_hive.dart';

final cartProvider = ChangeNotifierProvider((ref) => CartProvider());

class CartProvider extends ChangeNotifier {
  Box<CartHive> _cartBox = Hive.box<CartHive>('cart');

  List<CartHive> get cartItems => _cartBox.values.toList();

  void addItemToCart(CartHive item) {
    _cartBox.add(item);
    notifyListeners();
  }
}