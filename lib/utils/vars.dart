import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum NewsType {
  topTrending,
  allNews,
}

enum SortByName {
  relevancy,
  popularity,
  publishedAt,
}

TextStyle smallTextStyle = GoogleFonts.montserrat(
  fontSize: 16,
);

const List<String> searchKeywords = [
  'Football',
  'Flutter',
  'Python',
  'CSS',
  'HTML',
  'YouTube',
  'Netflix',
];
