import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/core/constants/app_colors.dart';

abstract class AppThemes {
  static ThemeData themeEnglish = ThemeData(
    fontFamily: 'Montserrat',
    primaryColor: AppColors.materialPrimary,
    scaffoldBackgroundColor: AppColors.white,
    splashColor: AppColors.materialPrimary.shade50.withOpacity(0.3),
    canvasColor: AppColors.white,
    iconTheme: const IconThemeData(
      color: AppColors.black10,
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.materialPrimary,
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.white,
      iconTheme: const IconThemeData(
        color: AppColors.black10,
      ),
      elevation: 2,
      scrolledUnderElevation: 0,
      titleSpacing: 1,
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: SystemUiOverlayStyle.dark.systemNavigationBarColor,
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    indicatorColor: AppColors.primary,
    popupMenuTheme: PopupMenuThemeData(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.materialPrimary.shade800,
      ),
      headlineMedium: TextStyle(
        fontSize: 26.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
      headlineSmall: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.black10,
      ),
      titleLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.black10,
      ),
      // AppBar
      titleMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.black10,
      ),
      // TextField
      titleSmall: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.black10,
      ),
      bodyLarge: TextStyle(
        fontSize: 18.sp,
        color: AppColors.black10,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        color: AppColors.black10,
        fontWeight: FontWeight.w400,
      ),
      // Text, NavBarItems
      bodySmall: TextStyle(
        fontSize: 13.sp,
        color: AppColors.black20,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontSize: 18.sp,
        color: AppColors.black10,
        fontWeight: FontWeight.w700,
      ),
      // Button
      labelMedium: TextStyle(
        fontSize: 16.sp,
        color: AppColors.black10,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontSize: 12.sp,
        color: AppColors.black20,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
  static ThemeData darkThemeEnglish = ThemeData(
    fontFamily: 'Montserrat',
    primaryColor: AppColors.materialPrimary,
    scaffoldBackgroundColor: AppColors.white,
    splashColor: AppColors.materialPrimary.shade50.withOpacity(0.3),
    canvasColor: AppColors.gray.shade900,
    iconTheme: const IconThemeData(
      color: AppColors.white10,
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.materialPrimary,
      onPrimary: AppColors.materialPrimary,
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.white10,
      iconTheme: const IconThemeData(
        color: AppColors.white10,
      ),
      elevation: 2,
      scrolledUnderElevation: 0,
      titleSpacing: 1,
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: SystemUiOverlayStyle.dark.systemNavigationBarColor,
        statusBarColor: AppColors.white10,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    indicatorColor: AppColors.primary,
    popupMenuTheme: PopupMenuThemeData(
      color: AppColors.white10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 30.sp, color: AppColors.white, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(
        fontSize: 26.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
      headlineSmall: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.white10,
      ),
      titleLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.white10,
      ),
      // AppBar
      titleMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.white10,
      ),
      // TextField
      titleSmall: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.white10,
      ),
      bodyLarge: TextStyle(
        fontSize: 18.sp,
        color: AppColors.white10,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        color: AppColors.white10,
        fontWeight: FontWeight.w400,
      ),
      // Text, NavBarItems
      bodySmall: TextStyle(
        fontSize: 13.sp,
        color: AppColors.white10,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontSize: 18.sp,
        color: AppColors.white10,
        fontWeight: FontWeight.w700,
      ),
      // Button
      labelMedium: TextStyle(
        fontSize: 16.sp,
        color: AppColors.white10,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontSize: 12.sp,
        color: AppColors.primary,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
