import 'package:flutter/material.dart';
import 'package:news_reader/screens/news.dart';

import '../models/rss_parser.dart';
import 'news_detail_screen.dart';

class NewsListScreen extends StatelessWidget {
  final String url;

  const NewsListScreen({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: FutureBuilder<List<News>>(
        future: RssParser().parse(url),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final news = snapshot.data!;
            return ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(news[index].title),
                  subtitle: Text(news[index].description),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => NewsDetailScreen(news: news[index]),
                    ));
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
