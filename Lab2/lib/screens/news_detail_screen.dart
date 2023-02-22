import 'package:flutter/material.dart';
import 'package:news_reader/screens/news.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailScreen extends StatelessWidget {
  final News news;

  const NewsDetailScreen({required this.news});

  @override
  Widget build(BuildContext context) {
    WebViewController _controller;
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
      ),
      body: WebView(
        initialUrl: news.link,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) => _controller = controller,
        navigationDelegate: (request) {
          if (request.url.startsWith('http')) {
            return NavigationDecision.navigate;
          }
          return NavigationDecision.prevent;
        },
      ),
    );
  }
}
