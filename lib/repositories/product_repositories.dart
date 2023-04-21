import 'package:dio/dio.dart';
import '../models/product_model.dart';

class ProductRepositories{
  final dio = Dio();

  Future<List<ProductModel>> getAllProducts() async {
    final List<ProductModel> result = [];
    final Response response = await dio.get('https://fakestoreapi.com/products');
    if(response.statusCode==200){
      final listData = response.data;
      for(var item in listData){
        result.add(ProductModel.fromJson(item));
      }
    }
    print(result);
    return result;
  }

}