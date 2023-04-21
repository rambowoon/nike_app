import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
import '../../models/product_model.dart';
import '../../repositories/product_repositories.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        children: [
          SearchProduct(),
          SizedBox(height: kDefaultPadding,),
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

class ListProduct extends StatefulWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {

  final ProductRepositories _productRepositories = ProductRepositories();
  late final Future<List<ProductModel>> futureProducts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Khai bao data
    _initData();
  }

  _initData() async {
    futureProducts = _productRepositories.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.amber,
            child: Center(child: Text('$index')),
          );
        }
      ),
    );
  }
}
