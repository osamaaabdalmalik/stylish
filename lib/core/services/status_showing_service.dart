import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:stylish/core/translations/local_keys.g.dart';

class StatusShowingService {
  StatusShowingService() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = 45
      ..maskType = EasyLoadingMaskType.black
      ..radius = 15;
  }

  static showError({required String message, int durationSeconds = 5}) {
    EasyLoading.instance
      ..userInteractions = true
      ..displayDuration = Duration(seconds: durationSeconds)
      ..errorWidget = const Icon(
        Icons.error_outline_rounded,
        size: 45,
      );
    showToast(message: message);
  }

  static showOfflineError() {
    EasyLoading.instance
      ..userInteractions = true
      ..displayDuration = const Duration(seconds: 5)
      ..errorWidget = const Icon(
        Icons.wifi_off_rounded,
        size: 45,
      );
    showToast(message: LocaleKeys.offline.tr());
  }

  static showInternalServerError({EasyLoadingMaskType maskType = EasyLoadingMaskType.black}) {
    EasyLoading.instance
      ..userInteractions = true
      ..displayDuration = const Duration(seconds: 5)
      ..errorWidget = const Icon(
        Icons.report_problem_outlined,
        size: 45,
      );
    showToast(message: LocaleKeys.serverError.tr());
  }

  static dismiss() {
    EasyLoading.dismiss(animation: true);
  }

  static showToast({
    required String message,
    EasyLoadingToastPosition toastPosition = EasyLoadingToastPosition.bottom,
  }) {
    EasyLoading.instance
      ..userInteractions = true
      ..displayDuration = const Duration(seconds: 3);
    EasyLoading.showToast(
      message,
      dismissOnTap: true,
      maskType: EasyLoadingMaskType.black,
      toastPosition: toastPosition,
    );
  }
}
