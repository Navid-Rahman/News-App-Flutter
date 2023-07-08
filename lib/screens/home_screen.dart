import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp_flutter/services/utils.dart';
import 'package:newsapp_flutter/utils/vars.dart';
import 'package:newsapp_flutter/widgets/articles_widget.dart';
import 'package:newsapp_flutter/widgets/drawer_widgets.dart';
import 'package:newsapp_flutter/widgets/taps.dart';
import 'package:newsapp_flutter/widgets/vertical_spacing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  var newsType = NewsType.allNews;
  String sortBy = SortByName.publishedAt.name;

  Widget paginationButtons({
    required Function function,
    required String text,
  }) {
    return ElevatedButton(
      onPressed: () {
        function();
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          backgroundColor: Colors.blue,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropDownItems {
    List<DropdownMenuItem<String>> menuItem = [
      DropdownMenuItem(
        value: SortByName.relevancy.name,
        child: Text(SortByName.relevancy.name),
      ),
      DropdownMenuItem(
        value: SortByName.popularity.name,
        child: Text(SortByName.popularity.name),
      ),
      DropdownMenuItem(
        value: SortByName.publishedAt.name,
        child: Text(SortByName.publishedAt.name),
      ),
    ];

    return menuItem;
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return SafeArea(
      child: Scaffold(
        /// Appbar section
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

        /// App drawer menu section
        drawer: const DrawerWidget(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  TapsWidget(
                    text: 'All News',
                    color: newsType == NewsType.allNews
                        ? Theme.of(context).cardColor
                        : Colors.transparent,
                    function: () {
                      if (newsType == NewsType.allNews) {
                        return;
                      }
                      setState(() {
                        newsType = NewsType.allNews;
                      });
                    },
                    fontsize: newsType == NewsType.allNews ? 20 : 16,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TapsWidget(
                    text: 'Top Trending',
                    color: newsType == NewsType.topTrending
                        ? Theme.of(context).cardColor
                        : Colors.transparent,
                    function: () {
                      if (newsType == NewsType.topTrending) {
                        return;
                      }
                      setState(() {
                        newsType = NewsType.topTrending;
                      });
                    },
                    fontsize: newsType == NewsType.topTrending ? 20 : 16,
                  ),
                ],
              ),
              const VerticalSpacing(10),

              /// Pagination section
              newsType == NewsType.topTrending
                  ? Container()
                  : SizedBox(
                      height: kBottomNavigationBarHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          paginationButtons(
                            function: () {
                              if (currentPageIndex == 0) {
                                return;
                              }
                              setState(() {
                                currentPageIndex -= 1;
                              });
                            },
                            text: 'Prev',
                          ),
                          Flexible(
                            flex: 2,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Material(
                                    color: currentPageIndex == index
                                        ? Colors.blue
                                        : Theme.of(context).cardColor,
                                    child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            currentPageIndex = index;
                                          });
                                        },
                                        child: Center(
                                            child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('${index + 1}'),
                                        ))),
                                  ),
                                );
                              },
                            ),
                          ),
                          paginationButtons(
                            function: () {
                              if (currentPageIndex == 4) {
                                return;
                              }
                              setState(() {
                                currentPageIndex += 1;
                              });
                            },
                            text: 'Next',
                          ),
                        ],
                      ),
                    ),

              const VerticalSpacing(10),

              /// Dropdown menu
              newsType == NewsType.topTrending
                  ? Container()
                  : Align(
                      alignment: Alignment.topRight,
                      child: Material(
                        color: Theme.of(context).cardColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DropdownButton(
                            value: sortBy,
                            items: dropDownItems,
                            onChanged: (
                              String? value,
                            ) {},
                          ),
                        ),
                      ),
                    ),

              /// Articles Widget section
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return const ArticlesWidget();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
