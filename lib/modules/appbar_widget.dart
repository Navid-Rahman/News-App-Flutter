// AppBarWidget.dart
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp_flutter/screens/search_screen.dart';
import 'package:newsapp_flutter/services/utils.dart';
import 'package:page_transition/page_transition.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;

    return AppBar(
      iconTheme: IconThemeData(color: color),
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: true,
      title: Text(
        'News app',
        style: GoogleFonts.lobster(
          textStyle: TextStyle(color: color, fontSize: 20, letterSpacing: 0.6),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: const SearchScreen(),
                inheritTheme: true,
                ctx: context,
              ),
            );
          },
          icon: const Icon(
            IconlyLight.search,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
