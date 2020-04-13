import 'package:flutter/material.dart';
import 'package:news_app/features/news/data/repositories/news_repository.dart';
import 'package:news_app/features/news/ui/widgets/news_list.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
          length: newsRepo.allCategories.length,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  child: SliverSafeArea(
                    top: false,
                    sliver: _appBar(innerBoxIsScrolled),
                  ),
                ),
              ];
            }, 
            body: TabBarView(
              children: List<Widget>.generate(newsRepo.allCategories.length, (index) => NewsList(
                category: newsRepo.allCategories.keys.toList()[index],
              )),
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

  List<Widget> get _tabs => List<Widget>.generate(newsRepo.allCategories.length, (index) => Tab(
    text: newsRepo.allCategories.values.toList()[index],
  ));

  // Functions
}