import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:newsapp_flutter/widgets/vertical_spacing.dart';

import '../provider/dark_theme_provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Drawer(
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Flexible(
                    child: Image(
                      image: AssetImage('assets/images/newspaper.png'),
                      height: 60,
                      width: 60,
                    ),
                  ),
                  const VerticalSpacing(20),
                  Flexible(
                    child: Text(
                      'News App',
                      style: GoogleFonts.lobster(
                          textStyle: const TextStyle(
                        fontSize: 20,
                        letterSpacing: 0.5,
                      )),
                    ),
                  ),
                ],
              ),
            ),
            const VerticalSpacing(20),
            ListTilesWidget(
              label: "Home",
              function: () {},
              icon: Icons.home_rounded,
            ),
            ListTilesWidget(
              label: "Bookmarks",
              function: () {},
              icon: Icons.bookmark_rounded,
            ),
            const Divider(
              thickness: 2,
            ),
            SwitchListTile(
              title: Text(
                themeState.getDarkTheme ? 'Dark' : 'Light',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              secondary: Icon(
                themeState.getDarkTheme ? Icons.dark_mode : Icons.light_mode,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onChanged: (bool value) {
                setState(() {
                  themeState.setDarkTheme = value;
                });
              },
              value: themeState.getDarkTheme,
            ),
          ],
        ),
      ),
    );
  }
}

class ListTilesWidget extends StatelessWidget {
  const ListTilesWidget({
    super.key,
    required this.label,
    required this.function,
    required this.icon,
  });

  final Function function;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.secondary,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      onTap: () {
        function();
      },
    );
  }
}
