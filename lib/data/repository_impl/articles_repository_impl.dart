import 'package:injectable/injectable.dart';
import 'package:news_app/core/result.dart';
import 'package:news_app/data/data_source_contract/articles_data_source.dart';
import 'package:news_app/data/models/articles/Article.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/domain/repository_contract/articles_repository.dart';

@Injectable(as: ArticlesRepository)
class ArticlesRepositoryImpl implements ArticlesRepository {
  ArticlesDataSource dataSource;

  @factoryMethod
  ArticlesRepositoryImpl({required this.dataSource});

  @override
  Future<Result<List<ArticleEntity>>> getArticles(SourceEntity source) async {
    var result = await dataSource.getArticles(source);
    switch (result) {
      case Success<List<Article>>():
        return Success(
          data:
              result.data
                  .map(
                    (article) => ArticleEntity(
                      author: article.author,
                      title: article.title,
                      publishedAt: article.publishedAt,
                      url: article.url,
                      urlToImage: article.urlToImage,
                    ),
                  )
                  .toList(),
        );
      case ServerError<List<Article>>():
        return ServerError(code: result.code, message: result.message);
      case GeneralEx<List<Article>>():
        return GeneralEx(exception: result.exception);
    }
  }
}
