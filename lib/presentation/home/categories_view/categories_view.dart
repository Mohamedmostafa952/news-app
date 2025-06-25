import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data/models/category_dm.dart';
import 'package:news_app/presentation/home/categories_view/category_item.dart';
import 'package:news_app/providers/home_view_provider.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key,});
  // final void Function(CategoryDm) onCategoryClicked;

  @override
  Widget build(BuildContext context) {
    HomeViewProvider homeViewProvider = Provider.of<HomeViewProvider>(context);
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
                return InkWell(
                    onTap: (){
                      // onCategoryClicked(CategoryDm.categories[index]);
                      homeViewProvider.goToSourceView(CategoryDm.categories[index]);
                    },
                    child: CategoryItem(category: CategoryDm.categories[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}
