import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:newsapp_flutter/models/news_model.dart';
import 'package:newsapp_flutter/utils/api_constants.dart';
import 'package:newsapp_flutter/utils/http_exceptions.dart';

class NewsAPiServices {
  static Future<List<NewsModel>> getAllNews(
      {required int page, required String sortBy}) async {
    try {
      // Construct the API endpoint URL
      var uri = Uri.https(BASEURL, "v2/everything", {
        "q": "bitcoin",
        "pageSize": "4",
        "domains": "techcrunch.com",
        "page": page.toString(),
        "sortBy": sortBy
      });

      // Make an HTTP GET request to retrieve news data
      var response = await http.get(
        uri,
        headers: {"X-Api-key": API_KEY},
      );

      // Parse the JSON response
      Map data = jsonDecode(response.body);
      List newsTempList = [];

      if (data['code'] != null) {
        // If the API response contains an error code, throw an exception
        throw HttpException(data['code']);
      }

      // Extract the news articles from the response and add them to the temporary list
      for (var v in data["articles"]) {
        newsTempList.add(v);
      }

      // Convert the temporary list of articles into a list of NewsModel objects
      return NewsModel.newsFromSnapshot(newsTempList);
    } catch (error) {
      throw error.toString();
    }
  }

  static Future<List<NewsModel>> getTopHeadlines() async {
    try {
      // Construct the API endpoint URL for top headlines
      var uri = Uri.https(BASEURL, "v2/top-headlines", {'country': 'us'});

      // Make an HTTP GET request to retrieve top headlines
      var response = await http.get(
        uri,
        headers: {"X-Api-key": API_KEY},
      );

      // Parse the JSON response
      Map data = jsonDecode(response.body);
      List newsTempList = [];

      if (data['code'] != null) {
        // If the API response contains an error code, throw an exception
        throw HttpException(data['code']);
      }

      // Extract the news articles from the response and add them to the temporary list
      for (var v in data["articles"]) {
        newsTempList.add(v);
      }

      // Convert the temporary list of articles into a list of NewsModel objects
      return NewsModel.newsFromSnapshot(newsTempList);
    } catch (error) {
      throw error.toString();
    }
  }

  static Future<List<NewsModel>> searchNews({required String query}) async {
    try {
      // Construct the API endpoint URL for searching news based on query
      var uri = Uri.https(BASEURL, "v2/everything", {
        "q": query,
        "pageSize": "10",
        "domains": "techcrunch.com",
      });

      // Make an HTTP GET request to search news
      var response = await http.get(
        uri,
        headers: {"X-Api-key": API_KEY},
      );

      // Parse the JSON response
      Map data = jsonDecode(response.body);
      List newsTempList = [];

      if (data['code'] != null) {
        // If the API response contains an error code, throw an exception
        throw HttpException(data['code']);
      }

      // Extract the news articles from the response and add them to the temporary list
      for (var v in data["articles"]) {
        newsTempList.add(v);
      }

      // Convert the temporary list of articles into a list of NewsModel objects
      return NewsModel.newsFromSnapshot(newsTempList);
    } catch (error) {
      throw error.toString();
    }
  }
}
