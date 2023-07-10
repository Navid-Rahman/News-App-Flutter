import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:newsapp_flutter/services/error_dialog.dart';
import 'package:newsapp_flutter/services/utils.dart';
import 'package:newsapp_flutter/widgets/vertical_spacing.dart';

class NewsDetailWebview extends StatefulWidget {
  const NewsDetailWebview({Key? key}) : super(key: key);

  @override
  State<NewsDetailWebview> createState() => _NewsDetailWebviewState();
}

class _NewsDetailWebviewState extends State<NewsDetailWebview> {
  late InAppWebViewController inAppWebViewController;
  final url = 'https://www.prothomalo.com/bangladesh/x1aqd70ru7';

  double _progress = 0;

  /// More actions button
  Future<void> _showModalSheetFunction() async {
    await showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const VerticalSpacing(20),

              /// Slider bar
              Center(
                child: Container(
                  height: 5,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const VerticalSpacing(20),
              const Text(
                'More Options',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const Divider(
                thickness: 2,
              ),

              const VerticalSpacing(20),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Share'),
                onTap: () async {
                  try {
                    await Share.share(url, subject: 'Look what I made!');
                  } catch (error) {
                    ErrorDialog.errorDialog(
                        errorMessage: error.toString(), context: context);
                  }
                },
              ),

              ListTile(
                leading: const Icon(Icons.open_in_browser),
                title: const Text('Open in browser'),
                onTap: () async {
                  if (!await launchUrl(Uri.parse(url))) {
                    throw Exception('Could not launch $url');
                  }
                },
              ),

              ListTile(
                leading: const Icon(Icons.refresh),
                title: const Text('Refresh'),
                onTap: () async {
                  try {
                    await inAppWebViewController.reload();
                  } catch (error) {
                    developer.log("Error occured $error");
                  } finally {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

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
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
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
                onPressed: () async {
                  await _showModalSheetFunction();
                },
                icon: const Icon(Icons.more_horiz),
              ),
            ],
          ),
          body: Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(
                    url,
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
