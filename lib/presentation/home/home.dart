import 'package:flutter/material.dart';
import 'package:news_app/core/routes_manager.dart';
import 'package:news_app/presentation/home/home_drawer/home_drawer.dart';
import 'package:news_app/providers/home_view_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // late Widget selectedWidget = CategoriesView(
  //   onCategoryClicked: onCategoryClicked,
  // );

  late HomeViewProvider homeViewProvider;

  @override
  Widget build(BuildContext context) {
    homeViewProvider = Provider.of<HomeViewProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(homeViewProvider.sourceName),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, RoutesManager.search);
          }, icon: Icon(Icons.search))
        ],
      ),
      drawer: HomeDrawer(),
      body: homeViewProvider.view,
    );
  }

  // void onCategoryClicked(CategoryDm category) {
  //   selectedWidget = SourcesView(category: category);
  //   setState(() {});
  // }
  //
  // void goToHome() {
  //   selectedWidget = CategoriesView(onCategoryClicked: onCategoryClicked);
  //   setState(() {});
  // }
}
