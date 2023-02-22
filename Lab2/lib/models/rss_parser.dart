import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';
import 'package:news_reader/screens/news.dart';

class RssParser {
  Future<List<News>> parse(String url) async {
    final response = await http.get(Uri.parse(url));
    final document = XmlDocument.parse(response.body);

    return document.findAllElements('item').map((item) {
      final title = item.findElements('title').single.text;
      final description = item.findElements('description').single.text;
      final link = item.findElements('link').single.text;
      return News(title: title, description: description, link: link);
    }).toList();
  }
}
