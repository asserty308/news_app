abstract class LoadNewsEvent {}

class GetTopHeadlines extends LoadNewsEvent {
  GetTopHeadlines(this.category);

  final String category;
}

class GetFavorites extends LoadNewsEvent {}