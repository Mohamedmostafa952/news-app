import 'package:flutter/material.dart';
import 'package:news_app/DM/category_dm.dart';
import 'package:news_app/presentation/home/categories_view/categories_view.dart';
import 'package:news_app/presentation/home/home_drawer/home_drawer.dart';
import 'package:news_app/presentation/home/sources_view/sources_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget selectedWidget = CategoriesView(
    onCategoryClicked: onCategoryClicked,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"), actions: [Icon(Icons.search)]),
      drawer: HomeDrawer(goToHome: goToHome),
      body: selectedWidget,
    );
  }

  void onCategoryClicked(CategoryDm category) {
    selectedWidget = SourcesView(category: category);
    setState(() {});
  }

  void goToHome() {
    selectedWidget = CategoriesView(onCategoryClicked: onCategoryClicked);
    setState(() {});
  }
}
