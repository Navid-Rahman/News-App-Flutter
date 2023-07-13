import 'package:flutter/material.dart';
import 'package:newsapp_flutter/models/news_model.dart';
import 'package:newsapp_flutter/services/news_api.dart';

class NewsProvider with ChangeNotifier {
  List<NewsModel> newsList = [];

  List<NewsModel> get getNewsList {
    return newsList;
  }

  // Fetches all news articles from the API based on page index and sorting criteria
  // pageIndex: The page index of news articles to fetch
  // sortBy: The sorting criteria for news articles
  // Returns: A list of news articles
  Future<List<NewsModel>> fetchAllNews(
      {required int pageIndex, required String sortBy}) async {
    newsList = await NewsAPiServices.getAllNews(
      page: pageIndex,
      sortBy: sortBy,
    );
    return newsList;
  }

  // Fetches top headlines from the API
  // Returns: A list of top headlines news articles
  Future<List<NewsModel>> fetchTopHeadlines() async {
    newsList = await NewsAPiServices.getTopHeadlines();
    return newsList;
  }

  // Searches for news articles based on the query
  // query: The search query
  // Returns: A list of search results news articles
  Future<List<NewsModel>> searchNewsProvider({required String query}) async {
    newsList = await NewsAPiServices.searchNews(query: query);
    return newsList;
  }

  // Finds a news article by its publishedAt date
  // publishedAt: The publishedAt date of the news article to find
  // Returns: The news article with the specified publishedAt date
  NewsModel findByDate({
    required String publishedAt,
  }) {
    return newsList.firstWhere((news) {
      return news.publishedAt == publishedAt;
    });
  }
}
