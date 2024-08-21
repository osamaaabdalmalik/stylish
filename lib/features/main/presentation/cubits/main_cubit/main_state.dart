part of 'main_cubit.dart';

@freezed
class MainState with _$MainState {
  const factory MainState.initial() = _Initial;

  const factory MainState.loading() = _Loading;

  const factory MainState.loaded() = _Loaded; //User? user

  const factory MainState.changeTabSuccess() = _ChangeTabSuccess;

  const factory MainState.logoutSuccess() = _LogoutSuccess;

  const factory MainState.error(String message) = _Error;
}
