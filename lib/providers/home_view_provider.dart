import 'package:flutter/material.dart';
import 'package:news_app/DM/category_dm.dart';
import 'package:news_app/presentation/home/categories_view/categories_view.dart';
import 'package:news_app/presentation/home/sources_view/sources_view.dart';

class HomeViewProvider extends ChangeNotifier{

  Widget view = CategoriesView();

  void goToSourceView(CategoryDm category){
    view = SourcesView(category: category);
    notifyListeners();
  }


  void goTpCategoriesView(){
    if(view == CategoriesView()) return;

    view = CategoriesView();
    notifyListeners();
  }
}