import 'package:dio/dio.dart';

import '../models/news_model.dart';

class NewsRepositories{
  final dio = Dio();

  Future<List<NewsModel>> getAllNews({required int page, required int limit, required String type}) async {
    final List<NewsModel> result = [];
    final Response response = await dio.get(
      'http://demo92.ninavietnam.org/api/v1.0/news/fetch',
      queryParameters: {
        'page': page ?? '1',
        'limit': limit ?? '10',
        'type': type ?? '',
      }
    );
    if(response.statusCode==200){
      final listData = response.data['data'];
      for (var item in listData) {
        result.add(NewsModel.fromJson(item));
      }
    }
    return result;
  }
}