import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/ui/widgets/center_progress_indicator.dart';
import 'package:flutter_core/ui/widgets/center_text.dart';
import 'package:news_app/features/news/bloc/load_news/load_news_bloc.dart';
import 'package:news_app/features/news/bloc/load_news/load_news_events.dart';
import 'package:news_app/features/news/bloc/load_news/load_news_states.dart';
import 'package:news_app/features/news/data/modes/articles_model.dart';

import 'news_card.dart';

class FavoritesList extends StatefulWidget {
  @override
  _FavoritesListState createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesList> {
  final _bloc = LoadNewsBloc();

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _blocBuilder;
  }

  // Widgets

  Widget get _blocBuilder => BlocBuilder(
    bloc: _bloc,
    builder: (context, state) {
      if (state is LoadNewsLoading) {
        return CenterProgressIndicator();
      }

      if (state is LoadNewsLoaded) {
        return _articleList(state.articles);
      }

      if (state is LoadNewsEmpty || state is LoadNewsError) {
        return CenterText('No favorites saved.');
      }

      // invalid state
      return Container();
    }
  );

  Widget _articleList(List<Article> articles) => RefreshIndicator(
    onRefresh: () => _loadFavorites(),
    child: ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: articles.length,
      itemBuilder: (context, i) {
        final article = articles[i];
        return NewsCard(article: article);
      }
    ),
  );

  // Functions

  Future<void> _loadFavorites() async {
    _bloc.add(GetFavorites());
  }
}