import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/ui/widgets/center_progress_indicator.dart';
import 'package:flutter_core/ui/widgets/center_text.dart';
import 'package:news_app/features/news/bloc/load_news/load_news_bloc.dart';
import 'package:news_app/features/news/bloc/load_news/load_news_events.dart';
import 'package:news_app/features/news/bloc/load_news/load_news_states.dart';
import 'package:news_app/features/news/data/modes/articles_model.dart';
import 'package:news_app/features/news/ui/widgets/news_card.dart';

class NewsList extends StatefulWidget {
  final String category;

  const NewsList({Key key, this.category}) : super(key: key);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final _bloc = LoadNewsBloc();

  @override
  void initState() {
    super.initState();
    _loadNews();
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
        return CenterText('No articles found. Check your connection and try again.');
      }

      // invalid state
      return Container();
    }
  );

  Widget _articleList(List<Article> articles) => ListView.builder(
    itemCount: articles.length,
    itemBuilder: (context, i) {
      final article = articles[i];
      return NewsCard(article: article);
    }
  );

  // Functions

  void _loadNews() async {
    _bloc.add(GetTopHeadlines(widget.category));
  }
}