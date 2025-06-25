import 'package:flutter/material.dart';

import 'package:news_app/core/result.dart';
import 'package:news_app/data/models/articles/Article.dart';
import 'package:news_app/data/models/sources/Source.dart';
import 'package:news_app/repository_contract/articles_repository.dart';

class ArticleViewProvider extends ChangeNotifier {
  ArticlesRepository repository;

  ArticleViewProvider({required this.repository});

  ArticleState articleState = ArticleLoadingState();
  List<Article> articles = [];

  Future<void> loadArticles(Source source, {int pageNumber = 1}) async {
    articleState = ArticleLoadingState();
    notifyListeners();
    var result = await repository.getArticles(source);
    switch (result) {
      case Success<List<Article>>():
        // articles.addAll(result.data);
      // articleState = ArticleSuccessState(articles: List.from(articles));
      articleState = ArticleSuccessState(articles: result.data);
        notifyListeners();
      case ServerError<List<Article>>():
        articleState = ArticleErrorState(serverError: result);
        notifyListeners();
      case GeneralEx<List<Article>>():
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
  List<Article> articles;

  ArticleSuccessState({required this.articles});
}

class ArticleErrorState extends ArticleState {
  ServerError? serverError;
  GeneralEx? exception;

  ArticleErrorState({this.serverError, this.exception});
}
