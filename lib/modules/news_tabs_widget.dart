// NewsTabs.dart
import 'package:flutter/material.dart';
import 'package:newsapp_flutter/utils/vars.dart';
import 'package:newsapp_flutter/widgets/taps.dart';

class NewsTabs extends StatefulWidget {
  final Function() onAllNewsSelected;
  final Function() onTopTrendingSelected;
  final bool isAllNewsSelected;

  const NewsTabs({
    Key? key,
    required this.onAllNewsSelected,
    required this.onTopTrendingSelected,
    required this.isAllNewsSelected,
  }) : super(key: key);

  @override
  _NewsTabsState createState() => _NewsTabsState();
}

class _NewsTabsState extends State<NewsTabs> {
  @override
  Widget build(BuildContext context) {
    final newsType =
        widget.isAllNewsSelected ? NewsType.allNews : NewsType.topTrending;

    return Row(
      children: [
        TapsWidget(
          text: 'All news',
          color: newsType == NewsType.allNews
              ? Theme.of(context).cardColor
              : Colors.transparent,
          function: () {
            if (newsType == NewsType.allNews) {
              return;
            }
            widget.onAllNewsSelected();
          },
          fontsize: newsType == NewsType.allNews ? 22 : 14,
        ),
        const SizedBox(
          width: 25,
        ),
        TapsWidget(
          text: 'Top trending',
          color: newsType == NewsType.topTrending
              ? Theme.of(context).cardColor
              : Colors.transparent,
          function: () {
            if (newsType == NewsType.topTrending) {
              return;
            }
            widget.onTopTrendingSelected();
          },
          fontsize: newsType == NewsType.topTrending ? 22 : 14,
        ),
      ],
    );
  }
}
