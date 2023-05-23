import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

import '../adapters/cart_hive.dart';

class CartProvider extends ChangeNotifier {
  Box<CartHive> _cartBox = Hive.box<CartHive>('cart');

  List<CartHive> get cartItems => _cartBox.values.toList();

  void addItemToCart(CartHive item) {
    final existingItemIndex = cartItems.indexWhere((cartItem) => cartItem.id == item.id);
    if (existingItemIndex != -1) {
      final existingItem = cartItems[existingItemIndex];
      existingItem.quantity += item.quantity;
      _cartBox.put(existingItem.key, existingItem);
    } else {
      _cartBox.add(item);
    }
    notifyListeners();
  }
  void updateItemQuantity(CartHive item, int newQuantity) {
    final existingItemIndex = cartItems.indexWhere((cartItem) => cartItem.id == item.id);
    if (existingItemIndex != -1) {
      final existingItem = cartItems[existingItemIndex];
      existingItem.quantity = newQuantity;
      _cartBox.put(existingItem.key, existingItem);
    }
    notifyListeners();
  }

  void removeItemFromCart(CartHive item) {
    final existingItemIndex = cartItems.indexWhere((cartItem) => cartItem.id == item.id);
    if (existingItemIndex != -1) {
      final existingItem = cartItems[existingItemIndex];
      _cartBox.delete(existingItem.key);
    }
    notifyListeners();
  }
}