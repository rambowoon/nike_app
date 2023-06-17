import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nike/models/news_model.dart';
import '../repositories/news_repositories.dart';

class NewsController extends AsyncNotifier<List<NewsModel>> {
  final NewsRepositories _newsRepositoreies = NewsRepositories();

  @override
  Future<List<NewsModel>> build() async {
    return await getAllNews(page: 1, limit: 10, type: 'blog');
  }

  Future<List<NewsModel>> getAllNews({required int page, required int limit, required String type}) async {
    final list = await _newsRepositoreies.getAllNews(page: page, limit: limit, type: type);
    return list;
  }

  Future<void> nextNews() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await getAllNews(page: 2, limit: 10, type: 'blog');
    });
  }
}