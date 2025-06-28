import 'package:news_app/core/result.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/entities/source_entity.dart';

abstract class ArticlesRepository{
  Future<Result<List<ArticleEntity>>> getArticles(SourceEntity sourceEntity);
}