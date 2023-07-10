import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp_flutter/models/news_model.dart';
import 'package:newsapp_flutter/utils/api_constants.dart';

class NewsApiServices {
  static Future<List<NewsModel>> getAllNews() async {
    // var url = Uri.parse(
    //     'https://newsapi.org/v2/everything?q=bitcoin&pageSize=5&apiKey=e7d516e675314b9b81eb718fd56b40ed');

    var uri = Uri.https(BASEURL, "v2/everything", {
      "q": "bitcoin",
      "pageSize": "5",
      "domains": "bbc.co.uk,techcrunch.com,engadget.com",
      // "apiKey": API_KEY,
    });

    var response = await http.get(uri, headers: {'X-Api-Key': API_KEY});
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    Map data = jsonDecode(response.body);
    List newsTempList = [];

    for (var v in data["articles"]) {
      newsTempList.add(v);
      // print(v);
      // print(data['articles'].length.toString());
    }
    return NewsModel.newsFromSnapshot(newsTempList);
  }
}
