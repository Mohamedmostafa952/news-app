import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/result.dart';
import 'package:news_app/data/models/articles/Article.dart';
import 'package:news_app/data/models/articles/ArticlesResponse.dart';
import 'package:news_app/data/models/category_dm.dart';
import 'package:news_app/data/models/sources/Source.dart';
import 'package:news_app/data/models/sources/SourcesResponse.dart';


class ApiServices {
  static const String _apiKey = "84707b7104ef456a9b93d8b9d76b34d5";
  static const String _baseUrl = "newsapi.org"; // authority
  static const String _sourcesEndPoint = "/v2/top-headlines/sources";
  static const String _articlesEndPoint = "/v2/everything";

  Future<Result<List<Source>>> getSources(CategoryDm category) async {
    try {
      Uri url = Uri.https(_baseUrl, _sourcesEndPoint, {
        "apiKey": _apiKey,
        "category": category.id,
      });

      var response = await http.get(url);
      var json = jsonDecode(response.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      if (sourcesResponse.status == "ok") {
        return Success(data: sourcesResponse.sources!);
      } else {
        return ServerError(
          code: sourcesResponse.code!,
          message: sourcesResponse.message!,
        );
      }
    } on Exception catch (e) {
      return GeneralEx(exception: e);
    }
  }

  // static Future<List<Article>> getArticles(Source source) async{
  //   Uri url = Uri.https(_baseUrl,_articlesEndPoint,{
  //     "apiKey": _apiKey,
  //     "sources" : source.id
  //   });
  //
  //   var response = await http.get(url);
  //
  //   var json = jsonDecode(response.body);
  //
  //   ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
  //
  //   return articlesResponse.articles!;
  // }

  Future<Result<List<Article>>> getArticles(Source source, {int pageNumber = 1}) async {
    try {
      Uri url = Uri.https(_baseUrl, _articlesEndPoint, {
        "apiKey": _apiKey,
        "sources": source.id,
        // "pageSize":"10",
        // "page":"$pageNumber"
      });

      var response = await http.get(url);

      var json = jsonDecode(response.body);

      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);

      if (articlesResponse.status == "ok") {
        return Success(data: articlesResponse.articles!);
      } else {
        return ServerError(
          code: articlesResponse.code!,
          message: articlesResponse.message!,
        );
      }
    } on Exception catch (e) {
      return GeneralEx(exception: e);
    }
  }

  Future<Result<List<Article>>> search(String searchKey) async{
    try{
      Uri url = Uri.https(_baseUrl,_articlesEndPoint,{
        "apiKey":_apiKey,
        "q":searchKey
      });

      var response = await http.get(url);
      var  json = jsonDecode(response.body);

      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);

      if(articlesResponse.status == "ok"){
        return Success(data: articlesResponse.articles!);
      }else{
        return ServerError(code: articlesResponse.code!, message: articlesResponse.message!);
      }
    }on Exception catch(e){
      return GeneralEx(exception: e);
    }
  }
}
