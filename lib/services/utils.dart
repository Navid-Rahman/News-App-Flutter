// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:newsapp_flutter/provider/dark_theme_provider.dart';

class Utils {
  Utils(
    this.context,
  );

  BuildContext context;

  bool get getTheme => Provider.of<DarkThemeProvider>(context).getDarkTheme;

  Color get getColor => getTheme ? Colors.white : Colors.black;
}
