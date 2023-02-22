import 'package:flutter/material.dart';
import 'package:news_reader/screens/news_list_screen.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RSS reader'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                labelText: 'RSS Feed URL',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final url = _urlController.text;
                if (url.isNotEmpty) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => NewsListScreen(url: url),
                  ));
                }
              },
              child: Text('View News'),
            ),
          ],
        ),
      ),
    );
  }
}
