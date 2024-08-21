import 'package:dartz/dartz.dart';
import 'package:stylish/core/helpers/failures.dart';
import 'package:stylish/features/main/domain/entities/feature_entity.dart';

abstract class MainRepo {
  Future<Either<Failure, Feature>> getFeature();
}
