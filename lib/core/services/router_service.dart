import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/core/constants/app_keys.dart';
import 'package:stylish/core/constants/app_routes.dart';
import 'package:stylish/core/services/caching_service.dart';
import 'package:stylish/features/main/presentation/screens/main_screen.dart';
import 'package:stylish/injection_container.dart';

class RouterService {
  final CacheService _cacheService;
  late GoRouter router;

  RouterService({required CacheService cacheService}) : _cacheService = cacheService {
    String initialLocation = _cacheService.getData<String>(
          key: AppKeys.initialLocationRoute,
        ) ??
        AppRoutes.mainScreen;
    router = GoRouter(
      routes: [
        //-------------------------------------------
        // Main Screens
        //-------------------------------------------
        GoRoute(
          path: AppRoutes.mainScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const MainScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
      ],
      initialLocation: initialLocation,
    );
  }

  static setInitialRoute(String route) {
    InjectionContainer.getIt<CacheService>().setData(
      key: AppKeys.initialLocationRoute,
      value: route,
    );
  }
}
