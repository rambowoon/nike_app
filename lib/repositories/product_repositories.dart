import 'package:dio/dio.dart';
import '../models/product_model.dart';

class ProductRepositories{
  final dio = Dio();

  Future<List<ProductModel>> getAllProducts({required int page, required int limit}) async {
    final List<ProductModel> result = [];
    final Response response = await dio.get(
      'http://demo92.ninavietnam.org/api/v1.0/products/fetch',
      queryParameters: {
        'page': page ?? '1',
        'limit': limit ?? '10',
      }
    );
    if(response.statusCode==200){
      final listData = response.data['data'];
      for (var item in listData) {
        result.add(ProductModel.fromJson(item));
      }
    }

    return result;
  }

}