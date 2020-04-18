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
    
    return Card(
      color: Colors.white,
      elevation: 1.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      child: GestureDetector(
        onTap: () => showScreen(context, ArticleScreen(article: article)),
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(article.urlToImage),
                ),
              ),
            ),
            Container(
              height: 125,
              child: Column(
                children: <Widget>[ 
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      article.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      article.description,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
          ]
        ),
      )
    );
  }
}