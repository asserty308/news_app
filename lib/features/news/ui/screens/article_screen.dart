import 'package:flutter/material.dart';
import 'package:flutter_core/ui/dialogs.dart';
import 'package:news_app/features/news/data/modes/articles_model.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({Key key, this.article}) : super(key: key);

  final Article article;

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    widget.article.urlToImage,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(widget.article.title),
              )
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: articleContent,
          )
        ),
      ),
    );
  }

  // Widgets

  Widget get articleContent => Column(
    children: <Widget>[
      buttonRow,
      Text(widget.article.description),
    ],
  );

  Widget get buttonRow => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      IconButton(
        icon: Icon(Icons.web), 
        iconSize: 32,
        tooltip: 'Im Web anzeigen',
        onPressed: () => openUrl(),
      ),
      IconButton(
        icon: Icon(Icons.share), 
        iconSize: 32,
        tooltip: 'Teilen',
        onPressed: () => share()
      ),
      IconButton(
        icon: Icon(Icons.star), 
        iconSize: 32,
        tooltip: 'Speichern',
        onPressed: () => toggleFavorite()
      ),
    ],
  );

  // Functions

  void openUrl() async {
    final url = widget.article.url;

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showOKDialog(context, 'Fehler', 'Leider kann der Artikel nicht geöffnet werden.');
    }
  }

  void share() {
    Share.share(widget.article.url);
  }

  void toggleFavorite() {
  }
}