import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/DM/article_dm.dart';
import 'package:news_app/DM/category_dm.dart';
import 'package:news_app/DM/source_dm.dart';
import 'package:news_app/core/assets_manager.dart';
import 'package:news_app/presentation/home/sources_view/article.dart';

class SourcesView extends StatelessWidget {
  SourcesView({super.key, required this.category});

  final CategoryDm category;

  List<SourceDm> sources = [
    SourceDm(id: "1", name: "ABC-News"),
    SourceDm(id: "1", name: "ABC-News"),
    SourceDm(id: "1", name: "ABC-News"),
    SourceDm(id: "1", name: "ABC-News"),
    SourceDm(id: "1", name: "ABC-News"),
    SourceDm(id: "1", name: "ABC-News"),
    SourceDm(id: "1", name: "ABC-News"),
    SourceDm(id: "1", name: "ABC-News"),
    SourceDm(id: "1", name: "ABC-News"),
    SourceDm(id: "1", name: "ABC-News"),
  ];

  List<ArticleDm> articles =[
    ArticleDm(
      title: "40-year-old man falls 200 feet to his death while canyoneering at national park",
      imagePath: AssetsManager.articleTestImage,
      author: "Mohamed Mostafa",
      publishAt: "15 minutes ago",
    ),
    ArticleDm(
      title: "40-year-old man falls 200 feet to his death while canyoneering at national park",
      imagePath: AssetsManager.articleTestImage,
      author: "Mohamed Mostafa",
      publishAt: "15 minutes ago",
    ),
    ArticleDm(
      title: "40-year-old man falls 200 feet to his death while canyoneering at national park",
      imagePath: AssetsManager.articleTestImage,
      author: "Mohamed Mostafa",
      publishAt: "15 minutes ago",
    ),
    ArticleDm(
      title: "40-year-old man falls 200 feet to his death while canyoneering at national park",
      imagePath: AssetsManager.articleTestImage,
      author: "Mohamed Mostafa",
      publishAt: "15 minutes ago",
    ),
    ArticleDm(
      title: "40-year-old man falls 200 feet to his death while canyoneering at national park",
      imagePath: AssetsManager.articleTestImage,
      author: "Mohamed Mostafa",
      publishAt: "15 minutes ago",
    ),
    ArticleDm(
      title: "40-year-old man falls 200 feet to his death while canyoneering at national park",
      imagePath: AssetsManager.articleTestImage,
      author: "Mohamed Mostafa",
      publishAt: "15 minutes ago",
    ),
    ArticleDm(
      title: "40-year-old man falls 200 feet to his death while canyoneering at national park",
      imagePath: AssetsManager.articleTestImage,
      author: "Mohamed Mostafa",
      publishAt: "15 minutes ago",
    ),
    ArticleDm(
      title: "40-year-old man falls 200 feet to his death while canyoneering at national park",
      imagePath: AssetsManager.articleTestImage,
      author: "Mohamed Mostafa",
      publishAt: "15 minutes ago",
    ),
    ArticleDm(
      title: "40-year-old man falls 200 feet to his death while canyoneering at national park",
      imagePath: AssetsManager.articleTestImage,
      author: "Mohamed Mostafa",
      publishAt: "15 minutes ago",
    ),
    ArticleDm(
      title: "40-year-old man falls 200 feet to his death while canyoneering at national park",
      imagePath: AssetsManager.articleTestImage,
      author: "Mohamed Mostafa",
      publishAt: "15 minutes ago",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: sources.length,
          child: TabBar(
            isScrollable: true,
            tabs: sources.map((source) => Tab(text: source.name)).toList(),
          ),
        ),
        SizedBox(height: 20.h),

        Expanded(
          child: ListView.separated(
            separatorBuilder: (_,_) => SizedBox(height: 16.h,),
              itemCount: articles.length,
              itemBuilder: (context,index) => Article(article: articles[index])),
        )
      ],
    );
  }
}
