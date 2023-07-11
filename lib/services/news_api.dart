import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:newsapp_flutter/models/news_model.dart';
import 'package:newsapp_flutter/utils/api_constants.dart';
import 'package:newsapp_flutter/utils/http_exceptions.dart';

class NewsApiServices {
  static Future<List<NewsModel>> getAllNews({
    required int page,
  }) async {
    //
    // var url = Uri.parse(
    //     'https://newsapi.org/v2/everything?q=bitcoin&pageSize=5&apiKey=');

    try {
      var uri = Uri.https(BASEURL, "v2/everything", {
        "q": "bitcoin",
        "pageSize": "5",
        "domains": "techcrunch.com",
        "page": page.toString(),

        // "apiKEY": API_KEY
      });
      var response = await http.get(
        uri,
        headers: {"X-Api-key": API_KEY},
      );
      log('Response status: ${response.statusCode}');
      // log('Response body: ${response.body}');
      Map data = jsonDecode(response.body);
      List newsTempList = [];

      if (data['code'] != null) {
        throw HttpException(data['code']);
        // throw data['message'];
      }
      for (var v in data["articles"]) {
        newsTempList.add(v);
        // log(v.toString());
        // print(data["articles"].length.toString());
      }
      return NewsModel.newsFromSnapshot(newsTempList);
    } catch (error) {
      throw error.toString();
    }
  }
}
