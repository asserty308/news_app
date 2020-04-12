import 'package:flutter/material.dart';
import 'package:news_app/features/news/ui/widgets/news_list.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<String> _newsCategories = ['General', 'Technology', 'Science', 'Entertainment', 'Sports', 'Health', 'Business'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _newsCategories.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Top Headlines'),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            tabs: _buildTabs(),
          ),
        ),
        body: TabBarView(
          children: List<Widget>.generate(_newsCategories.length, (index) => NewsList(category: _newsCategories[index],))
        )
      ),
    );
  }

  // Widgets

  List<Widget> _buildTabs() {
    List<Widget> tabs = [];

    for (final category in _newsCategories) {
      tabs.add(Tab(text: category,));
    }

    return tabs;
  }
}