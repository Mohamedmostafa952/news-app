import 'package:injectable/injectable.dart';
import 'package:news_app/core/result.dart';
import 'package:news_app/data/api_services/api_services.dart';
import 'package:news_app/data/data_source_contract/articles_data_source.dart';
import 'package:news_app/data/models/articles/Article.dart';
import 'package:news_app/domain/entities/source_entity.dart';

@Injectable(as: ArticlesDataSource)
class ArticleApiDataSourceImpl implements ArticlesDataSource {
  ApiServices apiServices;

  @factoryMethod
  ArticleApiDataSourceImpl({required this.apiServices});

  @override
  Future<Result<List<Article>>> getArticles(SourceEntity source) {
    return apiServices.getArticles(source);
  }
}
