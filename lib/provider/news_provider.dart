import 'package:flutter/material.dart';
import 'package:newsapp_flutter/models/news_model.dart';
import 'package:newsapp_flutter/services/news_api.dart';

class NewsProvider with ChangeNotifier {
  List<NewsModel> newsList = [];

  List<NewsModel> get getNewsList {
    return newsList;
  }

  Future<List<NewsModel>> fetchAllNews({
    required int pageIndex,
  }) async {
    newsList = await NewsApiServices.getAllNews(page: pageIndex);
    return newsList;
  }
}
