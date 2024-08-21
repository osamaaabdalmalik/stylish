part of 'feature_cubit.dart';

@freezed
class FeatureState with _$FeatureState {
  const factory FeatureState.initial() = _Initial;

  const factory FeatureState.loading() = _Loading;

  const factory FeatureState.loaded() = _Loaded;

  const factory FeatureState.componentChanged() = _ComponentChanged;

  const factory FeatureState.error(String message) = _Error;
}
