import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/core/widgets/error_widget.dart';
import 'package:news_app/data/api_services/api_services.dart';
import 'package:news_app/data/data_source_impl/search_data_source_impl.dart';
import 'package:news_app/data/repository_impl/search_repository_impl.dart';
import 'package:news_app/presentation/home/sources_view/article_item.dart';
import 'package:news_app/providers/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late TextEditingController searchController;
  late SearchViewModel searchProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = TextEditingController();
    searchProvider = SearchViewModel(
      repository: SearchRepositoryImpl(
        dataSource: SearchDataSourceImpl(apiServices: ApiServices()),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: searchController,
                style: TextStyle(color: ColorsManager.white),
                cursorColor: ColorsManager.white,
                onChanged: (value) {
                  searchProvider.search(value);
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: ColorsManager.grey),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: ColorsManager.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: ColorsManager.grey),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              ChangeNotifierProvider(
                create: (context) => searchProvider,
                child: Consumer<SearchViewModel>(
                  builder: (context, provider, child) {
                    var state = provider.searchState;
                    switch (state) {
                      case SearchSuccessState():
                        return Expanded(
                          child: ListView.separated(
                            separatorBuilder: (_, _) => SizedBox(height: 16.h),
                            itemCount: state.articles.length,
                            itemBuilder:
                                (context, index) =>
                                    ArticleItem(article: state.articles[index]),
                          ),
                        );
                      case SearchLoadingState():
                        return Expanded(
                          child: Text("no found articles"),
                        );
                      case SearchErrorState():
                        return ErrorStateWidget(
                          serverError: state.error,
                          exception: state.exception,
                        );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
