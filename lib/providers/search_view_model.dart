
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/result.dart';
import 'package:news_app/data/models/articles/Article.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/use_cases/search_usecase.dart';

@injectable
class SearchViewModel extends ChangeNotifier{

  SearchUseCase useCase;
  @factoryMethod
  SearchViewModel({required this.useCase});

  SearchState searchState = SearchLoadingState();


  Future<void> search(String searchKey) async{
    searchState = SearchLoadingState();
    if(searchKey.isEmpty){
      notifyListeners();
      return;
    }
    notifyListeners();
    var result = await useCase.invoke(searchKey);
    switch(result){
      case Success<List<ArticleEntity>>():
        searchState = SearchSuccessState(articles: result.data);
        notifyListeners();
      case ServerError<List<ArticleEntity>>():
        searchState = SearchErrorState(error: result);
        notifyListeners();
      case GeneralEx<List<ArticleEntity>>():
        searchState = SearchErrorState(exception: result);
        notifyListeners();
    }
  }
}


sealed class SearchState{}

class SearchSuccessState extends SearchState{
  List<ArticleEntity> articles;
  SearchSuccessState({required this.articles});
}

class SearchLoadingState extends SearchState{
  String? loadingMsg;
  SearchLoadingState({this.loadingMsg});
}

class SearchErrorState extends SearchState{
  ServerError? error;
  GeneralEx? exception;
  SearchErrorState({this.error, this.exception});
}