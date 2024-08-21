import 'package:dartz/dartz.dart';
import 'package:stylish/core/helpers/failures.dart';
import 'package:stylish/features/feature_for_copy/domain/repository/feature_repo.dart';
import 'package:stylish/features/main/domain/entities/feature_entity.dart';

class GetFeaturesUseCase {
  final FeatureRepo featureRepo;

  GetFeaturesUseCase({required this.featureRepo});

  Future<Either<Failure, List<Feature>>> call() async {
    return await featureRepo.getFeatures();
  }
}
