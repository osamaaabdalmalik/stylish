import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:stylish/core/helpers/failures.dart';
import 'package:stylish/core/services/state_manager_service.dart';
import 'package:stylish/features/feature_for_copy/data/data_sources/feature_remote_data_source.dart';
import 'package:stylish/features/feature_for_copy/domain/repository/feature_repo.dart';
import 'package:stylish/features/main/domain/entities/feature_entity.dart';
import 'package:stylish/injection_container.dart';

class FeatureRepoImpl implements FeatureRepo {
  final FeatureRemoteDataSource featureRemoteDataSource;

  const FeatureRepoImpl({required this.featureRemoteDataSource});

  @override
  Future<Either<Failure, List<Feature>>> getFeatures() async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getFeatures` in |FeatureRepoImpl|");
      var homeData = await featureRemoteDataSource.getFeatures();
      InjectionContainer.getIt<Logger>().w("End `getFeatures` in |FeatureRepoImpl|");
      return Right(homeData);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getFeatures` in |FeatureRepoImpl| Exception: ${e.runtimeType} $s",
      );
      return Left(StateManagerService.getFailureFromException(e));
    }
  }
}
