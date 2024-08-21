import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish/core/services/api_service.dart';
import 'package:stylish/core/services/bloc_observer_service.dart';
import 'package:stylish/core/services/caching_service.dart';
import 'package:stylish/core/services/network_info_service.dart';
import 'package:stylish/core/services/router_service.dart';
import 'package:stylish/core/services/status_showing_service.dart';
import 'package:stylish/features/feature_for_copy/data/data_sources/feature_remote_data_source.dart';
import 'package:stylish/features/feature_for_copy/data/repository/feature_repo_impl.dart';
import 'package:stylish/features/feature_for_copy/domain/repository/feature_repo.dart';
import 'package:stylish/features/feature_for_copy/domain/usecases/get_feature_use_case.dart';
import 'package:stylish/features/feature_for_copy/presentation/cubits/feature_cubit/feature_cubit.dart';

import 'features/main/data/data_sources/main_remote_data_source.dart';
import 'features/main/data/repository/main_repo_impl.dart';
import 'features/main/domain/repository/main_repo.dart';
import 'features/main/domain/usecases/get_home_data_use_case.dart';
import 'features/main/presentation/cubits/main_cubit/main_cubit.dart';

abstract class InjectionContainer {
  static GetIt getIt = GetIt.instance;

  static Future<void> initAppDependencies() async {
    await initCoreServices();
    await initMainDependencies();
    await initFeatureDependencies();
  }

  static Future<void> initCoreServices() async {
    /// Helper Services
    GetIt.instance.registerSingleton(Logger());
    GetIt.instance.registerSingleton(StatusShowingService());
    GetIt.instance.registerSingleton(BlocObserverService());
    Bloc.observer = getIt<BlocObserverService>();

    /// Cache Services
    var perf = await SharedPreferences.getInstance();
    GetIt.instance.registerSingleton<SharedPreferences>(perf);
    GetIt.instance.registerSingleton<CacheService>(
      CacheServiceImpl(
        pref: getIt<SharedPreferences>(),
      ),
    );

    /// API Services
    GetIt.instance.registerSingleton(InternetConnectionChecker());
    GetIt.instance.registerSingleton<NetworkInfoService>(
      NetworkInfoServiceImpl(
        getIt<InternetConnectionChecker>(),
      ),
    );
    GetIt.instance.registerSingleton(Client());
    GetIt.instance.registerSingleton<ApiService>(
      ApiServiceImpl(
        client: getIt<Client>(),
        networkInfo: getIt<NetworkInfoService>(),
        cacheService: getIt<CacheService>(),
      ),
    );

    /// Router Services
    GetIt.instance.registerSingleton<RouterService>(
      RouterService(
        cacheService: getIt<CacheService>(),
      ),
    );
  }

  static Future<void> initMainDependencies() async {
    /// Data Sources
    GetIt.instance.registerLazySingleton<MainRemoteDataSource>(
      () => MainRemoteDataSourceImpl(
        apiService: getIt(),
      ),
    );
    // GetIt.instance.registerLazySingleton<MainLocalDataSource>(
    //   () => MainLocalDataSourceImpl(
    //     cacheService: getIt(),
    //   ),
    // );

    /// Repositories
    GetIt.instance.registerLazySingleton<MainRepo>(
      () => MainRepoImpl(
        mainRemoteDataSource: getIt(),
        // mainLocalDataSource: getIt(),
      ),
    );

    /// UseCases
    GetIt.instance.registerLazySingleton(
      () => GetHomeDataUseCase(mainRepo: getIt()),
    );

    /// Cubits and Blocs
    GetIt.instance.registerFactory(() => MainCubit());
  }

  static Future<void> initFeatureDependencies() async {
    /// Data Sources
    GetIt.instance.registerLazySingleton<FeatureRemoteDataSource>(
      () => FeatureRemoteDataSourceImpl(
        apiService: getIt(),
      ),
    );
    // GetIt.instance.registerLazySingleton<MainLocalDataSource>(
    //   () => MainLocalDataSourceImpl(
    //     cacheService: getIt(),
    //   ),
    // );

    /// Repositories
    GetIt.instance.registerLazySingleton<FeatureRepo>(
      () => FeatureRepoImpl(
        featureRemoteDataSource: getIt(),
      ),
    );

    /// UseCases
    GetIt.instance.registerLazySingleton(
      () => GetFeaturesUseCase(featureRepo: getIt()),
    );

    /// Cubits and Blocs
    GetIt.instance.registerFactory(() => FeatureCubit());
  }
}
