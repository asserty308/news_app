import 'package:flutter/material.dart';
import 'package:flutter_core/routing/routing.dart';
import 'package:news_app/core/widgets/background_title_card.dart';
import 'package:news_app/features/news/data/modes/articles_model.dart';
import 'package:news_app/features/news/ui/screens/article_screen.dart';

class NewsCard extends StatelessWidget {
  NewsCard({
    Key key,
    this.article
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    final url = article.urlToImage;

    if (url == null || url.isEmpty) {
      return Container();
    }

    return BackgroundTitleCard(
      background: Image.network(
        article.urlToImage,
        fit: BoxFit.cover,
      ), 
      title: article.title, 
      onTap: () => showScreen(context, ArticleScreen(article: article)),
    );
  }
}