// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api_services/api_services.dart' as _i671;
import '../../data/data_source_contract/articles_data_source.dart' as _i435;
import '../../data/data_source_contract/search_data_source.dart' as _i14;
import '../../data/data_source_contract/sources_data_source.dart' as _i1058;
import '../../data/data_source_impl/articles_data_source_impl.dart' as _i285;
import '../../data/data_source_impl/search_data_source_impl.dart' as _i949;
import '../../data/data_source_impl/sources_data_source_impl.dart' as _i489;
import '../../data/repository_impl/articles_repository_impl.dart' as _i520;
import '../../data/repository_impl/search_repository_impl.dart' as _i613;
import '../../data/repository_impl/sources_repository_impl.dart' as _i688;
import '../../domain/repository_contract/articles_repository.dart' as _i575;
import '../../domain/repository_contract/search_repository.dart' as _i458;
import '../../domain/repository_contract/sources_repository.dart' as _i614;
import '../../domain/use_cases/get_articles_usecase.dart' as _i2;
import '../../domain/use_cases/get_sources_usecase.dart' as _i736;
import '../../domain/use_cases/search_usecase.dart' as _i34;
import '../../providers/article_view_provider.dart' as _i518;
import '../../providers/search_view_model.dart' as _i354;
import '../../providers/sources_view_provider.dart' as _i707;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i671.ApiServices>(() => _i671.ApiServices());
    gh.factory<_i435.ArticlesDataSource>(
      () =>
          _i285.ArticleApiDataSourceImpl(apiServices: gh<_i671.ApiServices>()),
    );
    gh.factory<_i14.SearchDataSource>(
      () => _i949.SearchDataSourceImpl(apiServices: gh<_i671.ApiServices>()),
    );
    gh.factory<_i458.SearchRepository>(
      () => _i613.SearchRepositoryImpl(dataSource: gh<_i14.SearchDataSource>()),
    );
    gh.factory<_i34.SearchUseCase>(
      () => _i34.SearchUseCase(repository: gh<_i458.SearchRepository>()),
    );
    gh.factory<_i1058.SourcesDataSource>(
      () =>
          _i489.SourcesApiDataSourceImpl(apiServices: gh<_i671.ApiServices>()),
    );
    gh.factory<_i354.SearchViewModel>(
      () => _i354.SearchViewModel(useCase: gh<_i34.SearchUseCase>()),
    );
    gh.factory<_i614.SourcesRepository>(
      () => _i688.SourcesRepositoryImpl(
        dataSource: gh<_i1058.SourcesDataSource>(),
      ),
    );
    gh.factory<_i575.ArticlesRepository>(
      () => _i520.ArticlesRepositoryImpl(
        dataSource: gh<_i435.ArticlesDataSource>(),
      ),
    );
    gh.factory<_i2.GetArticlesUseCase>(
      () => _i2.GetArticlesUseCase(repository: gh<_i575.ArticlesRepository>()),
    );
    gh.factory<_i736.GetSourcesUseCase>(
      () => _i736.GetSourcesUseCase(repository: gh<_i614.SourcesRepository>()),
    );
    gh.factory<_i518.ArticleViewProvider>(
      () => _i518.ArticleViewProvider(useCase: gh<_i2.GetArticlesUseCase>()),
    );
    gh.factory<_i707.SourcesViewProvider>(
      () => _i707.SourcesViewProvider(useCase: gh<_i736.GetSourcesUseCase>()),
    );
    return this;
  }
}
