// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'package:newsapp_flutter/models/news_model.dart';
import 'package:newsapp_flutter/screens/news_details_screen.dart';
import 'package:newsapp_flutter/screens/news_details_webview.dart';
import 'package:newsapp_flutter/services/utils.dart';

class TopTrendingWidget extends StatelessWidget {
  const TopTrendingWidget({
    Key? key,
    required String url,
    // required this.url,
  }) : super(key: key);

  // final String url;

  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getScreenSize;
    final Color color = Utils(context).getColor;
    final newsModelProvider = Provider.of<NewsModel>(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              NewsDetailsScreen.routeName,
              arguments: newsModelProvider.publishedAt,
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  boxFit: BoxFit.fill,
                  errorWidget: Image.asset('assets/images/empty_image.png'),
                  imageUrl: newsModelProvider.urlToImage,
                  height: size.height * 0.33,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  newsModelProvider.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: NewsDetailWebview(
                            url: newsModelProvider.url,
                          ),
                          type: PageTransitionType.rightToLeft,
                          inheritTheme: true,
                          ctx: context,
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.link,
                      color: color,
                    ),
                  ),
                  const Spacer(),
                  SelectableText(
                    newsModelProvider.dateToShow,
                    style: GoogleFonts.montserrat(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
