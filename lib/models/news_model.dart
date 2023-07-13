// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:reading_time/reading_time.dart';

import 'package:newsapp_flutter/services/fomatted_date.dart';

class NewsModel with ChangeNotifier {
  NewsModel({
    required this.authorName,
    required this.content,
    required this.dateToShow,
    required this.description,
    required this.newsId,
    required this.publishedAt,
    required this.readingTimeText,
    required this.sourceName,
    required this.title,
    required this.url,
    required this.urlToImage,
  });

  /// fromJson factory constructor; in-order to read the json data
  factory NewsModel.fromJson(dynamic json) {
    // Extract necessary fields from the JSON data
    String title = json["title"] ?? "";
    String content = json["content"] ?? "";
    String description = json["description"] ?? "";

    String dateToShow = "";

    // Format the publishedAt date for display
    if (json["publishedAt"] != null) {
      dateToShow = FormattedDate.formattedDateText(json["publishedAt"]);
    }

    return NewsModel(
      authorName: json["author"] ?? "",
      content: content,
      dateToShow: dateToShow,
      description: description,
      newsId: json["source"]["id"] ?? "",
      publishedAt: json["publishedAt"] ?? "",
      readingTimeText: readingTime(title + description + content).msg,
      sourceName: json["source"]["name"] ?? "",
      title: title,
      url: json["url"] ?? "",
      urlToImage: json["urlToImage"] ??
          "'https://techcrunch.com/wp-content/uploads/2022/01/locket-app.jpg?w=1390&crop=1",
    );
  }

  // Properties of the NewsModel class
  String authorName;
  String content;
  String dateToShow;
  String description;
  String newsId;
  String publishedAt;
  String readingTimeText;
  String sourceName;
  String title;
  String url;
  String urlToImage;

  @override
  String toString() {
    return "Id: $newsId, Title: $title";
  }

  /// A getter to return a list of news models. So, that we don't need to write the previous code again and again to fetch the json data.
  static List<NewsModel> newsFromSnapshot(List newSnapshot) {
    return newSnapshot.map((json) {
      return NewsModel.fromJson(json);
    }).toList();
  }

  // Converts the NewsModel instance to a JSON representation
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data["newsId"] = newsId;
    data["authorName"] = authorName;
    data["content"] = content;
    data["dateToShow"] = dateToShow;
    data["description"] = description;
    data["publishedAt"] = publishedAt;
    data["readingTimeText"] = readingTimeText;
    data["sourceName"] = sourceName;
    data["title"] = title;
    data["url"] = url;
    data["urlToImage"] = urlToImage;

    return data;
  }
}
