import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:newsapp_flutter/services/utils.dart';
import 'package:newsapp_flutter/widgets/drawer_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          iconTheme: IconThemeData(color: color),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          title: Text(
            'News App',
            style: GoogleFonts.lobster(
              textStyle: TextStyle(
                color: color,
                fontSize: 20,
                letterSpacing: 0.5,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ),
            ),
          ],
        ),
        drawer: const DrawerWidget(),
        body: Container(),
      ),
    );
  }
}
