import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp_flutter/services/utils.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;

    Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(color: color),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          'Bookmarks',
          style: GoogleFonts.lobster(
            textStyle: TextStyle(
              color: color,
              fontSize: 20,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
