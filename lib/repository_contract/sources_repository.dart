import 'package:news_app/core/result.dart';
import 'package:news_app/data/models/category_dm.dart';
import 'package:news_app/data/models/sources/Source.dart';

abstract class SourcesRepository{
  Future<Result<List<Source>>> getSources(CategoryDm category);
}