import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp_flutter/services/utils.dart';
import 'package:newsapp_flutter/widgets/empty_screen.dart';

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
      body: const EmptyNewsWidget(
        text: "you didn't add anything to your bookmarks yet.",
        imagePath: 'assets/images/bookmark.png',
      ),

      // ListView.builder(
      //   itemCount: 20,
      //   itemBuilder: (context, index) {
      //     return const ArticlesWidget();
      //   },
      // ),
    );
  }
}
