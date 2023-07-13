// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:newsapp_flutter/provider/dark_theme_provider.dart';

class Utils {
  Utils(
    this.context,
  );

  BuildContext context;

  bool get getTheme {
    return Provider.of<DarkThemeProvider>(context).getDarkTheme;
  }

  Color get getColor {
    return getTheme ? Colors.white : Colors.black;
  }

  Size get getScreenSize {
    return MediaQuery.of(context).size;
  }

  Color get baseShimmerColor {
    return getTheme ? Colors.grey.shade500 : Colors.grey.shade200;
  }

  Color get highlightShimmerColor {
    return getTheme ? Colors.grey.shade700 : Colors.grey.shade400;
  }

  Color get widgetShimmerColor {
    return getTheme ? Colors.grey.shade600 : Colors.grey.shade100;
  }
}
