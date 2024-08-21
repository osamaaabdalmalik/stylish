import 'package:stylish/core/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class RegexValidator {
  static const emailRegex =
      r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$';
  static const phoneRegex = r'^[0-9,--+-]+$';
  static const numberRegex = r'^[0-9]+$';
  static const passwordRegex8CharactersInLength = r'^.{8,}';
  static const nameRegex = r'^[\u0600-\u06FFa-zA-Z\s]+$';

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.thisFieldIsRequired.tr();
    } else if (!RegExp(emailRegex).hasMatch(value)) {
      return LocaleKeys.theEmailIsNotValid.tr();
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.nameIsRequired.tr();
    } else if (!RegExp(nameRegex).hasMatch(value)) {
      return LocaleKeys.theNameIsNotValid.tr();
    }
    return null;
  }

  static String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.thisFieldIsRequired.tr();
    }
    return null;
  }

  static String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.thisFieldIsRequired.tr();
    }
    if (!RegExp(numberRegex).hasMatch(value)) {
      return LocaleKeys.itIsNotNumber.tr();
    }
    return null;
  }

  // static String? validateVerifyCode(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return LocaleKeys.thisFieldIsRequired.tr();
  //   }
  //   if (!RegExp(numberRegex).hasMatch(value)) {
  //     return LocaleKeys.itIsNotNumber.tr();
  //   } else if (value.length > 6) {
  //     return LocaleKeys.itJustConsistsOf6Digits.tr();
  //   }
  //   return null;
  // }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.phoneNumberIsRequired.tr();
    }
    if (!RegExp(phoneRegex).hasMatch(value)) {
      return LocaleKeys.itIsNotPhoneNumber.tr();
    }
    // if (value.length != 9) {
    //   return 'it must be 9 character';
    // }
    return null;
  }

  // static String? validatePassword(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return LocaleKeys.passwordIsRequired.tr();
  //   } else if (!RegExp(passwordRegex8CharactersInLength).hasMatch(value)) {
  //     return LocaleKeys.itShouldBeAtLeas8CharactersLong.tr();
  //   }
  //   return null;
  // }

  static String? validateConfirmPassword(String? value, String? pass) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.thisFieldIsRequired.tr();
    } else if (value != pass) {
      return LocaleKeys.thereIsNoMatch.tr();
    }
    return null;
  }

  static bool startsWithEnglishChar(String value) {
    RegExp englishCharRegex = RegExp(r'^[a-zA-Z0-9٠-٩]');
    return englishCharRegex.hasMatch(value);
  }

  static bool isOnlySpaces(String value) {
    return value.trim().isEmpty;
  }
}
