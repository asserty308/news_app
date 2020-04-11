import 'package:flutter/material.dart';
import 'package:news_app/features/core/widgets/background_title_card.dart';
import 'package:news_app/features/news/data/modes/articles_model.dart';

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
      onTap: null
    );
  }
}