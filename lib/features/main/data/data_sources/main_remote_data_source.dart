import 'package:logger/logger.dart';
import 'package:stylish/core/constants/app_endpoints.dart';
import 'package:stylish/core/services/api_service.dart';
import 'package:stylish/features/main/data/models/feature_model.dart';
import 'package:stylish/injection_container.dart';

abstract class MainRemoteDataSource {
  Future<FeatureModel> getFeature();
}

class MainRemoteDataSourceImpl extends MainRemoteDataSource {
  final ApiService apiService;

  MainRemoteDataSourceImpl({required this.apiService});

  @override
  Future<FeatureModel> getFeature() async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getFeature` in |MainRemoteDataSourceImpl|");

      Map<String, dynamic> mapData = await apiService.get(
        subUrl: AppEndpoints.getFeatures,
      );
      final homeDataModel = FeatureModel.fromJson(mapData['data']);

      InjectionContainer.getIt<Logger>().w("End `getFeature` in |MainRemoteDataSourceImpl|");
      return Future.value(homeDataModel);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getFeature` in |MainRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }
}
