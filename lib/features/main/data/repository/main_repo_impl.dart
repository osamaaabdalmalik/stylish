import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:stylish/core/helpers/failures.dart';
import 'package:stylish/core/services/state_manager_service.dart';
import 'package:stylish/features/main/domain/entities/feature_entity.dart';
import 'package:stylish/features/main/data/data_sources/main_remote_data_source.dart';
import 'package:stylish/features/main/domain/repository/main_repo.dart';
import 'package:stylish/injection_container.dart';

class MainRepoImpl implements MainRepo {
  final MainRemoteDataSource mainRemoteDataSource;

  const MainRepoImpl({required this.mainRemoteDataSource});

  @override
  Future<Either<Failure, Feature>> getFeature() async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getFeature` in |MainRepoImpl|");
      var homeData = await mainRemoteDataSource.getFeature();
      InjectionContainer.getIt<Logger>().w("End `getFeature` in |MainRepoImpl|");
      return Right(homeData);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getFeature` in |MainRepoImpl| Exception: ${e.runtimeType} $s",
      );
      return Left(StateManagerService.getFailureFromException(e));
    }
  }
}
