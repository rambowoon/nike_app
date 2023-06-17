import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nike/models/news_model.dart';
import 'package:nike/providers/news_notifier.dart';

final NewsProvider = AsyncNotifierProvider<NewsController,  List<NewsModel>>(() {
  return NewsController();
});
