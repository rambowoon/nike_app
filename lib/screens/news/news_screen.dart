import 'package:flutter/material.dart';
import 'package:nike/providers/news_provider.dart';
import 'package:nike/setting_language.dart';
import '../widgets/app_bar.dart';
import '../../constants.dart';
import '../../models/news_model.dart';
import '../widgets/news_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(ngonngu(context).tintuc,true, true),
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
          ListNews()
        ],
      ),
    );
  }
}

class ListNews extends ConsumerWidget {
  const ListNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsProvider = ref.watch(NewsProvider);

    return newsProvider.when(
        data: (listNews) => Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: listNews?.length,
                itemBuilder: (BuildContext context, int index) {
                  final NewsModel newsModel = listNews![index];
                  return NewsItem(news: newsModel);
                }
            ),
          ),
        ),
        error: (err, stack) => Text('Server đang có vấn đề'),
        loading: () => Center(child: CircularProgressIndicator.adaptive())
    );
  }
}