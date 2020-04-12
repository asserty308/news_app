import 'package:flutter_core/web/base_api.dart';
import 'package:news_app/features/core/util/secret_loader.dart';
import 'package:news_app/features/news/data/modes/articles_model.dart';

class NewsApi {
  final _api = BaseApi('https://newsapi.org/v2/');

  Future<dynamic> _fetchJSON(String path, [Map<String, String> params]) async {
    final apiKey = await SecretLoader.instance.loadSecret('api_key');
    final Map<String, String> query = {
      'apiKey': apiKey,
    };
    
    query.addAll(params);
    return _api.fetchJSON(path, query);
  }

  Future<ArticlesModel> fetchTopHeadlines([String category = 'general']) async {
    final query = {
      'country': 'de', // TODO(ya): Make editable from settings screen
      'category': category,
    };

    final response = await _fetchJSON('top-headlines', query);
    return ArticlesModel.fromJson(response);
  }
}