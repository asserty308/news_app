import 'package:flutter/material.dart';
import 'package:flutter_core/routing/routing.dart';
import 'package:flutter_core/ui/dialogs.dart';
import 'package:intl/intl.dart';
import 'package:news_app/features/news/data/modes/articles_model.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  NewsCard({
    Key key,
    this.article
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return _buildCard(context);
  }

  Widget _buildCard(BuildContext context) => Card(
    color: Colors.white,
    elevation: 2.0,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    margin: const EdgeInsets.all(8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12)
    ),
    child: GestureDetector(
      onTap: () => _openUrl(context),
      child: Column(
        children: <Widget>[
          _buildImage(context),
          _buildArticleInfo(),
        ]
      ),
    )
  );

  Widget _buildImage(BuildContext context) => article.urlToImage == null ? Container() : Container(
    width: MediaQuery.of(context).size.width,
    height: 200,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(article.urlToImage),
      ),
    ),
  );

  Widget _buildArticleInfo() => Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[ 
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Text(
            DateFormat('dd.MM.yyyy HH:mm').format(article.publishDate) + ' Uhr',
          ),
        ),
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
        _buttonRow,
      ],
    ),
  );

  Widget get _buttonRow => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      IconButton(
        icon: Icon(Icons.more_vert,), 
        iconSize: 20,
        tooltip: 'Actions',
        onPressed: () => _share()
      ),
    ],
  );

  // Functions

  void _openUrl(BuildContext context) async {
    final url = article.url;

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showOKDialog(context, 'Fehler', 'Leider kann der Artikel nicht geöffnet werden.');
    }
  }

  void _share() {
    Share.share(article.url);
  }

  void _toggleFavorite() {
  }
}