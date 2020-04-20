import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/bloc/load_news/load_news_events.dart';
import 'package:news_app/features/news/bloc/load_news/load_news_states.dart';
import 'package:news_app/features/news/data/repositories/news_repository.dart';

class LoadNewsBloc extends Bloc<LoadNewsEvent, LoadNewsState> {
  @override
  LoadNewsState get initialState => LoadNewsEmpty();

  @override
  Stream<LoadNewsState> mapEventToState(LoadNewsEvent event) async* {
    if (event is GetTopHeadlines) {
      yield* _mapGetTopHeadlinesToState(event);
    } else if (event is GetFavorites) {
      yield* _mapGetFavoritesToState(event);
    }
  }

  Stream<LoadNewsState> _mapGetTopHeadlinesToState(GetTopHeadlines event) async* {
    yield LoadNewsLoading();

    try {
      final topHeadlines = await newsRepo.getTopHeadlines(event.category);

      if (topHeadlines.isEmpty) {
        yield LoadNewsEmpty();
      } else {
        yield LoadNewsLoaded(articles: topHeadlines);
      }
    } catch (_) {
      yield LoadNewsError();
    }
  }

  Stream<LoadNewsState> _mapGetFavoritesToState(GetFavorites event) async* {
    yield LoadNewsLoading();

    try {
      final favorites = newsRepo.getFavorites();

      if (favorites.isEmpty) {
        yield LoadNewsEmpty();
      } else {
        yield LoadNewsLoaded(articles: favorites);
      }
    } catch (_) {
      yield LoadNewsError();
    }
  }
}