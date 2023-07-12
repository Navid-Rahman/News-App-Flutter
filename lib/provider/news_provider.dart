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
    required String sortBy,
  }) async {
    newsList = await NewsApiServices.getAllNews(
      page: pageIndex,
      sortBy: sortBy,
    );
    return newsList;
  }

  Future<List<NewsModel>> fetchTopHeadlines() async {
    newsList = await NewsApiServices.getTopHeadlines();
    return newsList;
  }

  Future<List<NewsModel>> searchNewsProvider({required String query}) async {
    newsList = await NewsApiServices.searchNews(query: query);
    return newsList;
  }

  NewsModel findByDate({
    required String publishedAt,
  }) {
    return newsList.firstWhere((news) => news.publishedAt == publishedAt);
  }
}
