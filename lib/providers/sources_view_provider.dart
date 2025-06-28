import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:news_app/core/result.dart';
import 'package:news_app/data/models/category_dm.dart';
import 'package:news_app/data/models/sources/Source.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/domain/use_cases/get_sources_usecase.dart';

@injectable
class SourcesViewProvider extends ChangeNotifier {
  // List<Source> sources = [];
  // List<Article> articles = [];

  // to load sources first, so we make this function future to block until it load sources
  // Future<void> getSources(CategoryDm category) async{
  //   sources = await ApiServices.getSources(category);
  //   notifyListeners();
  // }

  GetSourcesUseCase useCase;
  @factoryMethod
  SourcesViewProvider({required this.useCase});

  SourceState sourceState = SourceLoadingState();

  Future<void> loadSources(CategoryDm category) async {
    sourceState = SourceLoadingState();
    notifyListeners();
    var result = await useCase.invoke(category);
    switch (result) {
      case Success<List<SourceEntity>>():
        sourceState = SourceSuccessState(sources: result.data);
        notifyListeners();
      case ServerError<List<SourceEntity>>():
        sourceState = SourceErrorState(serverError: result);
        notifyListeners();
      case GeneralEx<List<SourceEntity>>():
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
  List<SourceEntity> sources;

  SourceSuccessState({required this.sources});
}

class SourceErrorState extends SourceState {
  ServerError? serverError;
  GeneralEx? exception;

  SourceErrorState({this.serverError, this.exception});
}

