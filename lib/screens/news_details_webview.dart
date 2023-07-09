import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:newsapp_flutter/services/utils.dart';

class NewsDetailWebview extends StatefulWidget {
  const NewsDetailWebview({Key? key}) : super(key: key);

  @override
  State<NewsDetailWebview> createState() => _NewsDetailWebviewState();
}

class _NewsDetailWebviewState extends State<NewsDetailWebview> {
  late InAppWebViewController inAppWebViewController;

  double _progress = 0;

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return SafeArea(
      /// WillPopScope to use the backward function on the webview properly
      child: WillPopScope(
        onWillPop: () async {
          if (await inAppWebViewController.canGoBack()) {
            inAppWebViewController.goBack();
            // stay inside
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: color),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'URL',
              style: TextStyle(
                color: color,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              ),
            ],
          ),
          body: Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(
                    'https://techcrunch.com/2022/06/17/marc-lores-food-delivery-startup-wonder-raises-350m-3-5b-valuation/',
                  ),
                ),
                onWebViewCreated: (InAppWebViewController controller) {
                  inAppWebViewController = controller;
                },
                onProgressChanged: (controller, progress) {
                  setState(() {
                    _progress = progress / 100;
                  });
                },
              ),
              _progress < 1
                  ? Container(
                      child: LinearProgressIndicator(
                        value: _progress,
                        color:
                            _progress == 1 ? Colors.transparent : Colors.blue,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
