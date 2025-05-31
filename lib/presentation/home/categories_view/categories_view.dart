import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/DM/category_dm.dart';
import 'package:news_app/presentation/home/categories_view/category_item.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(15),
      child: Column(
        children: [
          Text(
            "Good Morning\nHere is Some News For You",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: CategoryDm.categories.length,
              itemBuilder: (context, index) {
                return CategoryItem(category: CategoryDm.categories[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
