import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/DM/article_dm.dart';
import 'package:news_app/core/colors_manager.dart';

class Article extends StatelessWidget {
  const Article({super.key, required this.article});

  final ArticleDm article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(8),
      margin: REdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: ColorsManager.white,
          width: 1.w
        )
      ),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(article.imagePath)),
          SizedBox(height: 10.h),
          Text(article.title, style: Theme.of(context).textTheme.titleSmall),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(article.author, style: Theme.of(context).textTheme.labelSmall,),
              Text(article.publishAt, style: Theme.of(context).textTheme.labelSmall,),
            ],
          )
        ],
      ),
    );
  }
}
