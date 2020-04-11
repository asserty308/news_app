import 'package:flutter/material.dart';
import 'package:news_app/features/news/data/modes/articles_model.dart';
import 'package:news_app/features/news/data/repositories/news_repository.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final _repo = NewsRepository();
  List<Article> _articles = [];

  void _loadNews() async {
    _articles = await _repo.getTopHeadlines();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Schlagzeilen'),
      ),
      body: ListView.builder(
        itemCount: _articles.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: EdgeInsets.all(8), 
            child: Text(
              '${i+1}. ' + _articles[i].title,
            ),
          );
        }
      ),
    );
  }
}