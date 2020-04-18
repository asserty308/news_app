import 'package:news_app/features/news/data/modes/articles_model.dart';

abstract class LoadNewsState {}
class LoadNewsEmpty extends LoadNewsState {}
class LoadNewsLoading extends LoadNewsState {}

class LoadNewsLoaded extends LoadNewsState {
  LoadNewsLoaded({
    this.articles,
  });

  final List<Article> articles;
}

class LoadNewsError extends LoadNewsState {}

