import 'package:flutter/material.dart';
import 'package:news_app/features/news/ui/widgets/news_list.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final Map<String, String> _tabCategories = {
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
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverSafeArea(
                  top: false,
                  sliver: _appBar(innerBoxIsScrolled),
                ),
              ),
            ],
            body: TabBarView(
              children: List<Widget>.generate(
                _tabCategories.length, 
                (index) => NewsList(
                  category: _tabCategories.keys.toList()[index],
                )
              ),
          )
        ),
      ),
    );
  }

  // Widgets

  Widget _appBar(bool innerBoxIsScrolled) => SliverAppBar(
    title: Text('Top Headlines', style: TextStyle(color: Colors.black),),
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    floating: true,
    pinned: true,
    snap: false,
    primary: true,
    forceElevated: innerBoxIsScrolled,
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

  List<Widget> get _tabs => List<Widget>.generate(_tabCategories.length, (index) => Tab(
    text: _tabCategories.values.toList()[index],
  ));
}