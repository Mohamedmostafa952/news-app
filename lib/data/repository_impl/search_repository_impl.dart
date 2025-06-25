import 'package:news_app/core/result.dart';
import 'package:news_app/data/data_source_contract/search_data_source.dart';
import 'package:news_app/data/models/articles/Article.dart';
import 'package:news_app/repository_contract/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository{

  SearchDataSource dataSource;
  SearchRepositoryImpl({required this.dataSource});

  @override
  Future<Result<List<Article>>> search(String searchKey) async{
    var result = await dataSource.search(searchKey);
    switch(result){
      case Success<List<Article>>():
        return Success(data: result.data);
      case ServerError<List<Article>>():
        return ServerError(code: result.code, message: result.message);
      case GeneralEx<List<Article>>():
        return GeneralEx(exception: result.exception);
    }
  }

}