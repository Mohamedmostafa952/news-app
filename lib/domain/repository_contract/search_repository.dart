import 'package:news_app/core/result.dart';
import 'package:news_app/domain/entities/article_entity.dart';

abstract class SearchRepository{
  Future<Result<List<ArticleEntity>>> search(String searchKey);
}