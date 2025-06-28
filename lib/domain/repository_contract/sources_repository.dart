import 'package:news_app/core/result.dart';
import 'package:news_app/data/models/category_dm.dart';
import 'package:news_app/domain/entities/source_entity.dart';

abstract class SourcesRepository{
  Future<Result<List<SourceEntity>>> getSources(CategoryDm category);
}