import 'package:injectable/injectable.dart';
import 'package:news_app/core/result.dart';
import 'package:news_app/data/models/category_dm.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/domain/repository_contract/sources_repository.dart';

@injectable
class GetSourcesUseCase {
  SourcesRepository repository;

  @factoryMethod
  GetSourcesUseCase({required this.repository});

  Future<Result<List<SourceEntity>>> invoke(CategoryDm category) {
    return repository.getSources(category);
  }
}
