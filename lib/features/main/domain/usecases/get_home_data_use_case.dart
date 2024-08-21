import 'package:dartz/dartz.dart';
import 'package:stylish/core/helpers/failures.dart';
import 'package:stylish/features/main/domain/entities/feature_entity.dart';
import 'package:stylish/features/main/domain/repository/main_repo.dart';

class GetHomeDataUseCase {
  final MainRepo mainRepo;

  GetHomeDataUseCase({required this.mainRepo});

  Future<Either<Failure, Feature>> call() async {
    return await mainRepo.getFeature();
  }
}
