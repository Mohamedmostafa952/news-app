import 'package:news_app/core/result.dart';
import 'package:news_app/data/api_services/api_services.dart';
import 'package:news_app/data/data_source_contract/sources_data_source.dart';
import 'package:news_app/data/models/category_dm.dart';
import 'package:news_app/data/models/sources/Source.dart';

class SourcesApiDataSourceImpl implements SourcesDataSource {
  ApiServices apiServices;

  SourcesApiDataSourceImpl({required this.apiServices});

  @override
  Future<Result<List<Source>>> getSource(CategoryDm category) {
    return apiServices.getSources(category);
  }
}

// instead of getting data from api, we want to get data from FireStore
//  so, this will be better and adaptable
