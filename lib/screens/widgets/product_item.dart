import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nike/constants.dart';
import 'package:nike/models/product_model.dart';
import 'package:nike/providers/favorite_products_provider.dart';

import '../../adapters/cart_hive.dart';
import '../../providers/cart_provider.dart';

class ProductItem extends ConsumerWidget {
  final ProductModel product;

  const ProductItem({required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.read(cartProvider.notifier);
    final favorite = ref.watch(favoriteProvider);
    bool checkFavorite = false;
    if(favorite.value != null) {
      checkFavorite = favorite.value!.contains(product.id ?? 0);
    }

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.network(
                  product.image.toString(),
                  fit: BoxFit.contain,
                  height: 150,
                  alignment: Alignment.center,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(
                    checkFavorite ? Icons.favorite_outlined : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    ref.read(favoriteProvider.notifier).toggle(product.id ?? 0);
                  },
                ),
              )
            ]
          ),
          SizedBox(height: 5,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
                product.title.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Stack(
                  children: [
                    Row(
                      children: List.generate(5, (index) => Icon(Icons.star, color: Colors.black26, size: 15,)),
                    ),
                    Positioned(
                      child: Row(
                        children: List.generate(product.rating!.rate!.floor(), (index) => Icon(Icons.star, color: Colors.yellow, size: 15,)),
                      ),
                    )
                  ],
                ),
                SizedBox(width: 2),
                Text(
                  product.rating!.count.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '\$${product.price}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.red
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5,),
          ElevatedButton.icon(
            onPressed: () {
              CartHive newItem = CartHive(
                id: product.id,
                title: product.title,
                price: product.price,
                image: product.image,
                quantity: 1,
              );
              cart.addItemToCart(newItem);
            },
            icon: Icon(
              Icons.add_shopping_cart,
              size: 24.0,
            ),
            label: Text(
              'Add To Cart',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kPrimaryColor),
              iconColor: MaterialStateProperty.all(Colors.white)
            ),
          ),
        ],
      ),
    );
  }
}