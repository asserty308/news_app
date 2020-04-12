import 'package:news_app/features/news/data/datasources/news_api.dart';
import 'package:news_app/features/news/data/modes/articles_model.dart';

class NewsRepository {
  final _remoteApi = NewsApi();

  Future<List<Article>> getTopHeadlines([String category = 'general']) async {
    final response = await _remoteApi.fetchTopHeadlines(category);
    // TODO(ya): error handling (offline, api error, etc.)
    return response.articles;
  }
}