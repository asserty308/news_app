import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/bloc/load_news/load_news_events.dart';
import 'package:news_app/features/news/bloc/load_news/load_news_states.dart';
import 'package:news_app/features/news/data/repositories/news_repository.dart';

class LoadNewsBloc extends Bloc<LoadNewsEvent, LoadNewsState> {
  final _newsRepo = NewsRepository();

  @override
  LoadNewsState get initialState => LoadNewsEmpty();

  @override
  Stream<LoadNewsState> mapEventToState(LoadNewsEvent event) async* {
    if (event is GetTopHeadlines) {
      yield LoadNewsLoading();

      try {
        final topHeadlines = await _newsRepo.getTopHeadlines(event.category);

        if (topHeadlines.isEmpty) {
          yield LoadNewsEmpty();
        } else {
          yield LoadNewsLoaded(articles: topHeadlines);
        }
      } catch (_) {
        yield LoadNewsError();
      }
    }
  }
}