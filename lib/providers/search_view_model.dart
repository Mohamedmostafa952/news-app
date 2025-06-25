
import 'package:flutter/material.dart';
import 'package:news_app/core/result.dart';
import 'package:news_app/data/models/articles/Article.dart';
import 'package:news_app/repository_contract/search_repository.dart';

class SearchViewModel extends ChangeNotifier{

  SearchRepository repository;
  SearchViewModel({required this.repository});

  SearchState searchState = SearchLoadingState();


  Future<void> search(String searchKey) async{
    searchState = SearchLoadingState();
    if(searchKey.isEmpty){
      notifyListeners();
      return;
    }
    notifyListeners();
    var result = await repository.search(searchKey);
    switch(result){
      case Success<List<Article>>():
        searchState = SearchSuccessState(articles: result.data);
        notifyListeners();
      case ServerError<List<Article>>():
        searchState = SearchErrorState(error: result);
        notifyListeners();
      case GeneralEx<List<Article>>():
        searchState = SearchErrorState(exception: result);
        notifyListeners();
    }
  }
}


sealed class SearchState{}

class SearchSuccessState extends SearchState{
  List<Article> articles;
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