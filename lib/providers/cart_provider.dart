import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'cart_notifier.dart';

final cartProvider = ChangeNotifierProvider((ref) => CartProvider());