import 'package:flutter/cupertino.dart';
import 'package:news_app/presentation/home/home.dart';
import 'package:news_app/presentation/search/search_view.dart';

class RoutesManager {

  static const String home = "/home";
  static const String search = "/search";

  static Route? router(RouteSettings settings){
    
    switch (settings.name) {
      case home:
        return CupertinoPageRoute(builder: (context) => Home());
      case search:
        return CupertinoPageRoute(builder: (context) => SearchView());
    }
    return null;
  }
}