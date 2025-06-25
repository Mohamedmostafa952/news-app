import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/widgets/error_widget.dart';
import 'package:news_app/data/api_services/api_services.dart';
import 'package:news_app/data/data_source_impl/articles_data_source_impl.dart';
import 'package:news_app/data/data_source_impl/sources_data_source_impl.dart';
import 'package:news_app/data/models/category_dm.dart';
import 'package:news_app/data/repository_impl/articles_repository_impl.dart';
import 'package:news_app/data/repository_impl/sources_repository_impl.dart';
import 'package:news_app/presentation/home/sources_view/article_item.dart';
import 'package:news_app/providers/article_view_provider.dart';
import 'package:news_app/providers/sources_view_provider.dart';
import 'package:provider/provider.dart';

class SourcesView extends StatefulWidget {
  const SourcesView({super.key, required this.category});

  final CategoryDm category;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  late SourcesViewProvider sourcesViewProvider;
  late ArticleViewProvider articleViewProvider;
  late ScrollController scrollController;
  int page = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();
    loadData();
  }

  loadData() async {
    sourcesViewProvider = SourcesViewProvider(
      repository: SourcesRepositoryImpl(
        dataSource: SourcesApiDataSourceImpl(apiServices: ApiServices()),
      ),
    );
    articleViewProvider = ArticleViewProvider(
      repository: ArticlesRepositoryImpl(
        dataSource: ArticleApiDataSourceImpl(apiServices: ApiServices()),
      ),
    );
    await sourcesViewProvider.loadSources(
      widget.category,
    ); // blocking until it load sources (future)
    // sourcesViewProvider.loadSources(widget.category);
    // sourcesViewProvider.loadArticles(sourcesViewProvider.sources[0]);
    articleViewProvider.loadArticles(
      (sourcesViewProvider.sourceState as SourceSuccessState).sources[0],
    );
    // scrollController.addListener((){
    //   if(scrollController.position.atEdge){
    //     if(scrollController.position.pixels != 0){
    //
    //       print("end of list");
    //       articleViewProvider.loadArticles(
    //           (sourcesViewProvider.sourceState as SourceSuccessState).sources[0], pageNumber: ++page
    //       );
    //     }
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: sourcesViewProvider),
        ChangeNotifierProvider.value(value: articleViewProvider),
      ],
      child: Column(
        children: [
          Consumer<SourcesViewProvider>(
            builder: (context, provider, child) {
              var state = provider.sourceState;

              switch (state) {
                case SourceSuccessState():
                  return DefaultTabController(
                    length: state.sources.length,
                    child: TabBar(
                      onTap: (index) {
                        articleViewProvider.loadArticles(
                          (provider.sourceState as SourceSuccessState)
                              .sources[index],
                        );
                        // scrollController.addListener(() {
                        //   if (scrollController.position.atEdge) {
                        //     if (scrollController.position.pixels != 0) {
                        //       print("end of list");
                        //       articleViewProvider.loadArticles(
                        //         (sourcesViewProvider.sourceState
                        //                 as SourceSuccessState)
                        //             .sources[index],
                        //         pageNumber: ++page,
                        //       );
                        //     }
                        //   }
                        // });
                      },
                      isScrollable: true,
                      tabs:
                          state.sources
                              .map((source) => Tab(text: source.name))
                              .toList(),
                    ),
                  );
                case SourceErrorState():
                  return ErrorStateWidget(
                    exception: state.exception,
                    serverError: state.serverError,
                  );
                case SourceLoadingState():
                  return Center(child: CircularProgressIndicator());
              }

              // return DefaultTabController(
              //   length: state.,
              //   child: TabBar(
              //     onTap: (index){
              //       sourcesViewProvider.loadArticles(sourcesViewProvider.sources[index]);
              //     },
              //     isScrollable: true,
              //     tabs:
              //         sources.map((source) => Tab(text: source.name)).toList(),
              //   ),
              // );
            },
          ),
          SizedBox(height: 20.h),
          Consumer<ArticleViewProvider>(
            builder: (context, provider, child) {
              // List<Article> articles = provider.articles;
              var state = provider.articleState;
              switch (state) {
                case ArticleLoadingState():
                  return Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  );
                case ArticleSuccessState():
                  return Expanded(
                    child: ListView.separated(
                      controller: scrollController,
                      separatorBuilder: (_, _) => SizedBox(height: 16.h),
                      itemCount: state.articles.length,
                      itemBuilder:
                          (context, index) =>
                              ArticleItem(article: state.articles[index]),
                    ),
                  );
                case ArticleErrorState():
                  return ErrorStateWidget(
                    exception: state.exception,
                    serverError: state.serverError,
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
