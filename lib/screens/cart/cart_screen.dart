import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nike/adapters/cart_hive.dart';
import '../../providers/cart_provider.dart';
import '../widgets/app_bar.dart';

class CartScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final cartItems = cart.cartItems;

    return Scaffold(
      appBar: buildAppBar('Cart', false, false),
      body: cartItems.isNotEmpty ? ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              child: ListTile(
                leading: Image.network(item.image.toString()),
                title: Text(
                  item.title.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    Text('Price: \$${item.price?.toStringAsFixed(2)}'),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                if (item.quantity > 1) {
                                  ref.read(cartProvider).updateItemQuantity(
                                      item, item.quantity - 1);
                                }
                              },
                            ),
                            Text(item.quantity.toString()),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                ref.read(cartProvider).updateItemQuantity(
                                    item, item.quantity + 1);
                              },
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _showDeleteConfirmationDialog(context, ref, item);

                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ) : Center(
        child: Text('Your cart is empty.'),
      )
    );
  }
}
void _showDeleteConfirmationDialog(BuildContext context,  WidgetRef ref, CartHive item) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Xóa?'),
        content: Text('Bạn có chắc chắn muốn xóa?'),
        actions: <Widget>[
          TextButton(
            child: Text('Hủy'),
            onPressed: () {
              Navigator.of(context).pop(); // Đóng AlertDialog
            },
          ),
          TextButton(
            child: Text('Xóa'),
            onPressed: () {
              ref.read(cartProvider).removeItemFromCart(item);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}