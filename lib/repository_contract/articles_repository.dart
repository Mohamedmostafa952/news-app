import 'package:news_app/core/result.dart';
import 'package:news_app/data/models/articles/Article.dart';
import 'package:news_app/data/models/sources/Source.dart';

abstract class ArticlesRepository{
  Future<Result<List<Article>>> getArticles(Source source);
}