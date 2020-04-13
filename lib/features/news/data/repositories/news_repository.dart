import 'package:news_app/features/news/data/datasources/news_api.dart';
import 'package:news_app/features/news/data/modes/articles_model.dart';

final newsRepo = _NewsRepository();

class _NewsRepository {
  final _remoteApi = NewsApi();

  final Map<String, String> allCategories = {
    'general': 'General', 
    'technology': 'Technology', 
    'science': 'Science', 
    'entertainment': 'Entertainment', 
    'sports': 'Sports', 
    'health': 'Health', 
    'business': 'Business'
  };

  Future<List<Article>> getTopHeadlines([String category = 'general']) async {
    final response = await _remoteApi.fetchTopHeadlines(category);
    // TODO(ya): error handling (offline, api error, etc.)
    return response.articles;
  }
}