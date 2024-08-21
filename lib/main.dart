import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/core/constants/app_themes.dart';
import 'package:stylish/core/services/router_service.dart';
import 'package:stylish/core/translations/codegen_loader.g.dart';
import 'package:stylish/features/main/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:stylish/injection_container.dart';

void main() async {
  await initSettings();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (c) => EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar'), Locale('tr')],
        path: 'assets/translations',
        startLocale: const Locale('en'),
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: const MyApp(),
      ),
    ),
  );
}

Future<void> initSettings() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await InjectionContainer.initAppDependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final designSize = const Size(375, 812);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      fontSizeResolver: (fontSize, instance) {
        final display = View.of(context).display;
        final screenSize = display.size / display.devicePixelRatio;
        final scaleWidth = screenSize.width / designSize.width;
        return fontSize * scaleWidth;
      },
      builder: (_, __) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => InjectionContainer.getIt<MainCubit>(),
          ),
        ],
        child: MaterialApp.router(
          title: 'APC PRIME',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          routerConfig: InjectionContainer.getIt<RouterService>().router,
          builder: EasyLoading.init(),
          themeMode: ThemeMode.light,
          theme: AppThemes.themeEnglish,
          darkTheme: AppThemes.darkThemeEnglish,
        ),
      ),
    );
  }
}
