import 'package:flutter/material.dart';
import 'package:news_app/features/news/ui/widgets/news_list.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Map<String, String> _newsCategories = {
    'general': 'General', 
    'technology': 'Technology', 
    'science': 'Science', 
    'entertainment': 'Entertainment', 
    'sports': 'Sports', 
    'health': 'Health', 
    'business': 'Business'
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _newsCategories.length,
      child: Scaffold(
        appBar: _appBar,
        body: TabBarView(
          children: List<Widget>.generate(_newsCategories.length, (index) => NewsList(
            category: _newsCategories.keys.toList()[index],
          )),
        ),
      ),
    );
  }

  // Widgets

  Widget get _appBar => AppBar(
    title: Text('Top Headlines'),
    centerTitle: true,
    leading: IconButton(icon: Icon(Icons.search), onPressed: () => null),
    actions: <Widget>[
      IconButton(icon: Icon(Icons.settings), onPressed: () => null),
    ],
    bottom: TabBar(
      isScrollable: true,
      tabs: _tabs,
    ),
  );

  List<Widget> get _tabs => List<Widget>.generate(_newsCategories.length, (index) => Tab(
    text: _newsCategories.values.toList()[index],
  ));
}