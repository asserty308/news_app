import 'package:flutter/material.dart';
import 'package:news_app/features/news/ui/widgets/favorites_list.dart';
import 'package:news_app/features/news/ui/widgets/news_list.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final Map<String, String> _tabCategories = {
    'favorites': 'Favorites',
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
    return Scaffold(
      body: DefaultTabController(
        length: _tabCategories.length,
        initialIndex: 1, // do not show favorites (index 0) as default
        child: SafeArea( // SafeArea removes the default space between tabs and content
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverSafeArea(
                  top: false,
                  sliver: _appBar,
                ),
              ),
            ],
            body: _body,
          ),
        ),
      ),
    );
  }

  // Widgets

  Widget get _appBar => SliverAppBar(
    title: Text('Top Headlines', style: TextStyle(color: Colors.black),),
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    floating: true, // makes title hide
    pinned: true, // when false, tabs would hide as well
    primary: true,
    forceElevated: true,
    centerTitle: true,
    actions: _actions,
    bottom: _tabBar,
  );

  Widget get _tabBar => TabBar(
    isScrollable: true,
    labelColor: Colors.black,
    tabs: _tabs,
  );

  List<Widget> get _actions => [
    IconButton(icon: Icon(Icons.search), onPressed: () => null),
    PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem<int>(
          value: 0,
          child: Text('Favorites'),
        ),
        PopupMenuItem<int>(
          value: 1,
          child: Text('Settings'),
        ),
      ],
      onSelected: (index) => null,
    ),
  ];

  List<Widget> get _tabs => List<Widget>.generate(_tabCategories.length, (index) {
    if (index == 0) {
      return Tab(
        icon: Icon(Icons.favorite),
      );
    }

    return Tab(
      text: _tabCategories.values.toList()[index],
    );
  });

  Widget get _body => TabBarView(
    children: List<Widget>.generate(
      _tabCategories.length, 
      (index) { 
        if (index == 0) {
          return FavoritesList();
        }

        return NewsList(
          category: _tabCategories.keys.toList()[index],
        );
      }
    ),
  );
}