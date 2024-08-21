import 'dart:convert';

import 'package:stylish/core/constants/app_routes.dart';
import 'package:stylish/core/enums/general_states.dart';
import 'package:stylish/core/helpers/exception.dart';
import 'package:stylish/core/helpers/failures.dart';
import 'package:stylish/core/services/router_service.dart';
import 'package:stylish/core/services/status_showing_service.dart';
import 'package:stylish/core/translations/local_keys.g.dart';
import 'package:stylish/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

abstract class StateManagerService {
  static Unit getExceptionStatusCode(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        return unit;
      case 400:
      case 422:
      case 403:
        Map body = json.decode(response.body);
        var data = body.containsKey('message') ? body['message'] : LocaleKeys.unexpectedError.tr();
        String message = LocaleKeys.unexpectedError.tr();
        if (data is String) message = data;
        Logger().w(json.decode(response.body));
        throw BadRequestException(message: message);
      case 401:
        throw UnAuthorizedException();
      case 404:
        throw NotFoundException();
      case 500:
        throw InternalServerErrorException();
      default:
        throw UnexpectedException();
    }
  }

  static Failure getFailureFromException(Object exception) {
    if (exception is BadRequestException) {
      return BadRequestFailure(message: exception.message);
    } else if (exception is UnAuthenticatedException) {
      return UnAuthenticatedFailure(message: LocaleKeys.unexpectedError.tr());
    } else if (exception is UnAuthorizedException) {
      return UnAuthorizedFailure(message: LocaleKeys.unexpectedError.tr());
    } else if (exception is NotFoundException) {
      return NotFoundFailure(message: LocaleKeys.serverError.tr());
    } else if (exception is InternalServerErrorException) {
      return InternalServerErrorFailure(
        message: LocaleKeys.serverError.tr(),
      );
    } else if (exception is OfflineException) {
      return OfflineFailure(message: LocaleKeys.offline.tr());
    } else {
      InjectionContainer.getIt<Logger>().e(
        "End `getFailureFromException` Exception: ${exception.toString()}",
      );
      return UnexpectedFailure(
        message: LocaleKeys.unexpectedError.tr(),
      );
    }
  }

  static GeneralStates getStateFromFailure(Failure failure) {
    if (failure is OfflineFailure) {
      StatusShowingService.showOfflineError();
      return GeneralStates.offline;
    }
    if (failure is BadRequestFailure) {
      StatusShowingService.showError(message: failure.message);
      return GeneralStates.badRequest;
    }
    if (failure is UnAuthenticatedFailure) {
      return GeneralStates.forbidden;
    }
    if (failure is UnAuthorizedFailure) {
      InjectionContainer.getIt<RouterService>().router.go(
            AppRoutes.signInScreen,
          );
      return GeneralStates.unAuthorized;
    }
    if (failure is NotFoundFailure) {
      return GeneralStates.notFound;
    }
    if (failure is InternalServerErrorFailure) {
      StatusShowingService.showInternalServerError();
      return GeneralStates.internalServerProblem;
    }
    StatusShowingService.showError(
      message: LocaleKeys.unexpectedError.tr(),
    );
    return GeneralStates.unexpectedProblem;
  }
}
