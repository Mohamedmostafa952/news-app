import 'package:injectable/injectable.dart';
import 'package:news_app/core/result.dart';
import 'package:news_app/data/api_services/api_services.dart';
import 'package:news_app/data/data_source_contract/search_data_source.dart';
import 'package:news_app/data/models/articles/Article.dart';

@Injectable(as: SearchDataSource)
class SearchDataSourceImpl implements SearchDataSource {

  ApiServices apiServices;
  @factoryMethod
  SearchDataSourceImpl({required this.apiServices});

  @override
  Future<Result<List<Article>>> search(String searchKey) {
    return apiServices.search(searchKey);
  }

}