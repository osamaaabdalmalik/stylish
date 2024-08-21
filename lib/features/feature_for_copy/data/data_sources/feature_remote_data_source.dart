import 'package:logger/logger.dart';
import 'package:stylish/core/constants/app_endpoints.dart';
import 'package:stylish/core/services/api_service.dart';
import 'package:stylish/features/main/data/models/feature_model.dart';
import 'package:stylish/injection_container.dart';

abstract class FeatureRemoteDataSource {
  Future<List<FeatureModel>> getFeatures();
}

class FeatureRemoteDataSourceImpl extends FeatureRemoteDataSource {
  final ApiService apiService;

  FeatureRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<FeatureModel>> getFeatures() async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getFeatures` in |FeatureRemoteDataSourceImpl|");

      Map<String, dynamic> mapData = await apiService.get(
        subUrl: AppEndpoints.getFeatures,
      );
      final featureModels = mapData['data'].map((e) => FeatureModel.fromJson(e)).toList();

      InjectionContainer.getIt<Logger>().w("End `getFeatures` in |FeatureRemoteDataSourceImpl|");
      return Future.value(featureModels);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getFeatures` in |FeatureRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }
}
