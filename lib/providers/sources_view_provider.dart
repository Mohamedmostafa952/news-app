import 'package:flutter/material.dart';

import 'package:news_app/core/result.dart';
import 'package:news_app/data/models/category_dm.dart';
import 'package:news_app/data/models/sources/Source.dart';
import 'package:news_app/repository_contract/sources_repository.dart';


class SourcesViewProvider extends ChangeNotifier {
  // List<Source> sources = [];
  // List<Article> articles = [];

  // to load sources first, so we make this function future to block until it load sources
  // Future<void> getSources(CategoryDm category) async{
  //   sources = await ApiServices.getSources(category);
  //   notifyListeners();
  // }

  SourcesRepository repository;
  SourcesViewProvider({required this.repository});

  SourceState sourceState = SourceLoadingState();

  Future<void> loadSources(CategoryDm category) async {
    sourceState = SourceLoadingState();
    notifyListeners();
    var result = await repository.getSources(category);
    switch (result) {
      case Success<List<Source>>():
        sourceState = SourceSuccessState(sources: result.data);
        notifyListeners();
      case ServerError<List<Source>>():
        sourceState = SourceErrorState(serverError: result);
        notifyListeners();
      case GeneralEx<List<Source>>():
        sourceState = SourceErrorState(exception: result);
        notifyListeners();
    }
  }

  // void loadArticles(Source source) async {
  //   articles = await ApiServices.getArticles(source);
  //   notifyListeners();
  // }


}

sealed class SourceState {}

class SourceLoadingState extends SourceState {
  String? loadingMessage;

  SourceLoadingState({this.loadingMessage});
}

class SourceSuccessState extends SourceState {
  List<Source> sources;

  SourceSuccessState({required this.sources});
}

class SourceErrorState extends SourceState {
  ServerError? serverError;
  GeneralEx? exception;

  SourceErrorState({this.serverError, this.exception});
}

