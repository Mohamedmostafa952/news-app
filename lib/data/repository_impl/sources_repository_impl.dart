import 'package:news_app/core/result.dart';
import 'package:news_app/data/data_source_contract/sources_data_source.dart';
import 'package:news_app/data/models/category_dm.dart';
import 'package:news_app/data/models/sources/Source.dart';
import 'package:news_app/repository_contract/sources_repository.dart';

class SourcesRepositoryImpl implements SourcesRepository{

  SourcesDataSource dataSource;
  SourcesRepositoryImpl({required this.dataSource});

  @override
  Future<Result<List<Source>>> getSources(CategoryDm category) async{
    var result = await dataSource.getSource(category);
    switch(result){
      case Success<List<Source>>():
        return Success(data: result.data);
      case ServerError<List<Source>>():
        return ServerError(code: result.code, message: result.message);
      case GeneralEx<List<Source>>():
        return GeneralEx(exception: result.exception);
    }
  }

}