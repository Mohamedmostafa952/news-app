import 'package:injectable/injectable.dart';
import 'package:news_app/core/result.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/domain/repository_contract/articles_repository.dart';

@injectable
class GetArticlesUseCase {
  ArticlesRepository repository;

  @factoryMethod
  GetArticlesUseCase({required this.repository});

  Future<Result<List<ArticleEntity>>> invoke(SourceEntity sourceEntity) {
    return repository.getArticles(sourceEntity);
  }
}
