import 'package:flutter/material.dart';
import 'package:nike/providers/favorite_products_provider.dart';
import 'package:nike/setting_language.dart';
import '../widgets/app_bar.dart';
import '../../constants.dart';
import '../../models/product_model.dart';
import '../widgets/product_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(ngonngu(context).yeuthich,true, true),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListProduct()
        ],
      ),
    );
  }
}

class ListProduct extends ConsumerWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productProvider = ref.watch(favoriteProductsProvider);

    return productProvider.when(
        data: (listProduct) => Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4/6.2
                ),
                itemCount: listProduct?.length,
                itemBuilder: (BuildContext context, int index) {
                  final ProductModel productModel = listProduct![index];
                  return ProductItem(product: productModel);
                }
            ),
          ),
        ),
        error: (err, stack) => Text('Server đang có vấn đề'),
        loading: () => Center(child: CircularProgressIndicator.adaptive())
    );
  }
}