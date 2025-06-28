import 'package:news_app/core/result.dart';
import 'package:news_app/data/models/articles/Article.dart';
import 'package:news_app/domain/entities/source_entity.dart';

abstract class ArticlesDataSource{
  Future<Result<List<Article>>> getArticles(SourceEntity source);
}