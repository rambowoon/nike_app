import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
import '../../models/product_model.dart';
import '../../providers/product_provider.dart';
import '../widgets/product_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        children: [
          SearchProduct(),
          SizedBox(height: 10,),
          ListProduct()
        ],
      ),
    );
  }
}

class SearchProduct extends StatefulWidget {
  const SearchProduct({Key? key}) : super(key: key);

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 4,
            child: Material(
              shadowColor: Colors.black,
              elevation: 2.0,
              borderRadius: BorderRadius.circular(14.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Looking for shoes",
                  prefixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: SvgPicture.asset("assets/icons/search.svg"),
                  ),
                ),
                onTap: () {},
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: CircleAvatar(
              backgroundColor: kPrimaryColor,
              radius: 30,
              child: IconButton(
                icon: SvgPicture.asset("assets/icons/filter.svg"),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ListProduct extends ConsumerWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return FutureBuilder(
      future: ref.read(ProductProvider.notifier).getAllProduct(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          final listProduct = ref.watch(ProductProvider.select((value) => value.listProduct));
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4/6
                ),
                itemCount: listProduct?.length,
                itemBuilder: (BuildContext context, int index) {
                  final ProductModel productModel = listProduct![index];
                  return ProductItem(product: productModel);
                }
              ),
            ),
          );
        }
        if(snapshot.hasError){
          return Text('Server đang có vấn đề');
        }
        return Center(child: CircularProgressIndicator.adaptive(),);
      },
    );
  }
}