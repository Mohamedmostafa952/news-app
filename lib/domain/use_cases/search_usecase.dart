import 'package:injectable/injectable.dart';
import 'package:news_app/core/result.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/repository_contract/search_repository.dart';

@injectable
class SearchUseCase{
  SearchRepository repository;
  @factoryMethod
  SearchUseCase({required this.repository});

  Future<Result<List<ArticleEntity>>> invoke(String searchKey){
    return repository.search(searchKey);
  }
}