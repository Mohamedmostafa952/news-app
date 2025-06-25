//interface
import 'package:news_app/core/result.dart';
import 'package:news_app/data/models/category_dm.dart';
import 'package:news_app/data/models/sources/Source.dart';

abstract class SourcesDataSource{
  Future<Result<List<Source>>> getSource(CategoryDm category);
}