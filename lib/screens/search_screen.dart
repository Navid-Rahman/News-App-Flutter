import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import 'package:newsapp_flutter/models/news_model.dart';
import 'package:newsapp_flutter/provider/news_provider.dart';
import 'package:newsapp_flutter/services/utils.dart';
import 'package:newsapp_flutter/utils/vars.dart';
import 'package:newsapp_flutter/widgets/articles_widget.dart';
import 'package:newsapp_flutter/widgets/empty_screen.dart';
import 'package:newsapp_flutter/widgets/vertical_spacing.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final FocusNode focusNode;
  bool isSearching = false;
  List<NewsModel>? searchList = [];

  late final TextEditingController _searchTextController;

  @override
  void dispose() {
    if (mounted) {
      _searchTextController.dispose();
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).getColor;
    final newsProvider = Provider.of<NewsProvider>(context);

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Column(
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    // Back button
                    GestureDetector(
                      onTap: () {
                        focusNode.unfocus();
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_sharp,
                      ),
                    ),
                    Flexible(
                      child: TextField(
                        focusNode: focusNode,
                        controller: _searchTextController,
                        style: TextStyle(color: color),
                        autofocus: true,
                        textInputAction: TextInputAction.search,
                        keyboardType: TextInputType.text,
                        onEditingComplete: () async {
                          // Search for news when editing is completed
                          searchList = await newsProvider.searchNewsProvider(
                              query: _searchTextController.text);
                          isSearching = true;
                          focusNode.unfocus();
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(bottom: 8 / 5),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: "Search",
                          suffix: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                // Clear search text and results
                                _searchTextController.clear();
                                focusNode.unfocus();
                                isSearching = false;
                                searchList!.clear();
                                setState(() {});
                              },
                              child: const Icon(
                                Icons.close_rounded,
                                size: 20,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalSpacing(20),
              if (!isSearching && searchList!.isEmpty)
                // Display suggested keywords when not searching and no search results
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MasonryGridView.count(
                      itemCount: searchKeywords.length,
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            // Search news based on the tapped keyword
                            searchList = await newsProvider.searchNewsProvider(
                                query: _searchTextController.text);
                            isSearching = true;
                            _searchTextController.text = searchKeywords[index];
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: color),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: FittedBox(
                                  child: Text(
                                    searchKeywords[index],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              if (isSearching && searchList!.isEmpty)
                // Display empty search result widget when searching and no results
                const Expanded(
                  child: EmptyNewsWidget(
                    text: 'Oops! Search result not found.',
                    imagePath: 'assets/images/search.png',
                  ),
                ),
              if (searchList != null && searchList!.isNotEmpty)
                // Display search results
                Expanded(
                  child: ListView.builder(
                    itemCount: searchList!.length,
                    itemBuilder: (ctx, index) {
                      return ArticlesWidget(
                        newsModel: searchList![index],
                      );
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
