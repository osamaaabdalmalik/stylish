import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:stylish/core/enums/general_states.dart';
import 'package:stylish/core/services/state_manager_service.dart';
import 'package:stylish/features/feature_for_copy/domain/usecases/get_feature_use_case.dart';
import 'package:stylish/features/main/domain/entities/feature_entity.dart';
import 'package:stylish/injection_container.dart';

part 'feature_cubit.freezed.dart';
part 'feature_state.dart';

class FeatureCubit extends Cubit<FeatureState> {
  FeatureCubit() : super(const FeatureState.initial());

  /// Use Cases
  final GetFeaturesUseCase getFeaturesUseCase = InjectionContainer.getIt();
  GeneralStates generalState = GeneralStates.init;

  /// Controllers
  final TextEditingController searchTextController = TextEditingController();

  /// Data
  List<Feature> features = [];

  /// variables

  /// functions
  Future<void> getFeatures() async {
    InjectionContainer.getIt<Logger>().i("Start `getFeatures` in |FeatureCubit|");
    _update(const FeatureState.loading());
    generalState = GeneralStates.loading;
    var result = await getFeaturesUseCase();
    result.fold(
      (l) {
        generalState = StateManagerService.getStateFromFailure(l);
        _update(FeatureState.error(l.message));
      },
      (r) {
        features = r;
        _update(const FeatureState.loaded());
        generalState = GeneralStates.success;
      },
    );
    InjectionContainer.getIt<Logger>().w(
      "End `getFeatures` in |FeatureCubit| General State:$generalState",
    );
  }

  void _update(FeatureState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
