import 'package:news_app/core/result.dart';
import 'package:news_app/data/api_services/api_services.dart';
import 'package:news_app/data/data_source_contract/articles_data_source.dart';
import 'package:news_app/data/models/articles/Article.dart';
import 'package:news_app/data/models/sources/Source.dart';

class ArticleApiDataSourceImpl implements ArticlesDataSource {
  ApiServices apiServices;

  ArticleApiDataSourceImpl({required this.apiServices});

  @override
  Future<Result<List<Article>>> getArticles(Source source) {
    return apiServices.getArticles(source);
  }
}
