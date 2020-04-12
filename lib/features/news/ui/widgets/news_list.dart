import 'package:flutter/material.dart';
import 'package:news_app/features/news/data/modes/articles_model.dart';
import 'package:news_app/features/news/data/repositories/news_repository.dart';
import 'package:news_app/features/news/ui/widgets/news_card.dart';

class NewsList extends StatefulWidget {
  final String category;

  const NewsList({Key key, this.category}) : super(key: key);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final _repo = NewsRepository();
  List<Article> _articles = [];

  @override
  void initState() {
    super.initState();
    _loadNews();
  }
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _articles.length,
      itemBuilder: (context, i) {
        final article = _articles[i];
        return Padding(
          padding: EdgeInsets.all(8), 
          child: NewsCard(article: article),
        );
      }
    );
  }

  // Functions

  void _loadNews() async {
    _articles = await _repo.getTopHeadlines(widget.category);

    if (mounted) {
      setState(() {});
    }
  }
}