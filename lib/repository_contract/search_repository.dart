import 'package:news_app/core/result.dart';
import 'package:news_app/data/models/articles/Article.dart';

abstract class SearchRepository{
  Future<Result<List<Article>>> search(String searchKey);
}