import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/result.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/domain/use_cases/get_articles_usecase.dart';

@injectable
class ArticleViewProvider extends ChangeNotifier {
  GetArticlesUseCase useCase;

  @factoryMethod
  ArticleViewProvider({required this.useCase});

  ArticleState articleState = ArticleLoadingState();

  // List<Article> articles = [];

  Future<void> loadArticles(SourceEntity source, {int pageNumber = 1}) async {
    articleState = ArticleLoadingState();
    notifyListeners();
    var result = await useCase.invoke(source);
    switch (result) {
      case Success<List<ArticleEntity>>():
        // articles.addAll(result.data);
        // articleState = ArticleSuccessState(articles: List.from(articles));
        articleState = ArticleSuccessState(articles: result.data);
        notifyListeners();
      case ServerError<List<ArticleEntity>>():
        articleState = ArticleErrorState(serverError: result);
        notifyListeners();
      case GeneralEx<List<ArticleEntity>>():
        articleState = ArticleErrorState(exception: result);
        notifyListeners();
    }
  }
}

sealed class ArticleState {}

class ArticleLoadingState extends ArticleState {
  String? loadingMsg;

  ArticleLoadingState({this.loadingMsg});
}

class ArticleSuccessState extends ArticleState {
  List<ArticleEntity> articles;

  ArticleSuccessState({required this.articles});
}

class ArticleErrorState extends ArticleState {
  ServerError? serverError;
  GeneralEx? exception;

  ArticleErrorState({this.serverError, this.exception});
}
