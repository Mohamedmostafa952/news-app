import 'package:flutter/material.dart';
import 'package:news_app/news_app.dart';
import 'package:news_app/providers/home_view_provider.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(ChangeNotifierProvider(
      create: (_) => HomeViewProvider(),
      child: NewsApp()));
}