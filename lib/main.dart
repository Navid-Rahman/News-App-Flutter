import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:newsapp_flutter/provider/dark_theme_provider.dart';
import 'package:newsapp_flutter/provider/news_provider.dart';
import 'package:newsapp_flutter/screens/home_screen.dart';
import 'package:newsapp_flutter/screens/news_details_screen.dart';
import 'package:newsapp_flutter/utils/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  // Retrieves the current app theme from shared preferences
  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provider for managing dark theme
        ChangeNotifierProvider<DarkThemeProvider>(
          create: (_) => themeChangeProvider,
        ),
        // Provider for managing news data
        ChangeNotifierProvider<NewsProvider>(
          create: (_) => NewsProvider(),
        ),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News App',
            // Set the theme based on dark theme status
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: const HomeScreen(),
            routes: {
              NewsDetailsScreen.routeName: (context) {
                return const NewsDetailsScreen();
              },
            },
          );
        },
      ),
    );
  }
}
