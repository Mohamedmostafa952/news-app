import 'package:news_app/core/result.dart';
import 'package:news_app/data/data_source_contract/articles_data_source.dart';
import 'package:news_app/data/models/articles/Article.dart';
import 'package:news_app/data/models/sources/Source.dart';
import 'package:news_app/repository_contract/articles_repository.dart';

class ArticlesRepositoryImpl implements ArticlesRepository{

  ArticlesDataSource dataSource;
  ArticlesRepositoryImpl({required this.dataSource});
  @override
  Future<Result<List<Article>>> getArticles(Source source) async{
    var result = await dataSource.getArticles(source);
    switch (result) {
      case Success<List<Article>>():
        return Success(data: result.data);
      case ServerError<List<Article>>():
        return ServerError(code: result.code, message: result.message);
      case GeneralEx<List<Article>>():
        return GeneralEx(exception: result.exception);
    }
  }

}