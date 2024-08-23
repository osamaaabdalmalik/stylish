import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stylish/core/constants/app_colors.dart';
import 'package:stylish/core/constants/app_keys.dart';
import 'package:stylish/core/enums/general_states.dart';
import 'package:stylish/core/services/caching_service.dart';
import 'package:stylish/features/main/presentation/screens/home_tab.dart';
import 'package:stylish/features/main/presentation/screens/profile_tab.dart';
import 'package:stylish/injection_container.dart';

part 'main_cubit.freezed.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState.initial()) {
    initMain();
  }

  /// Use Cases
  // final GetUserUseCase getUserUseCase = InjectionContainer.getIt();
  // final LogoutUseCase logoutUseCase = InjectionContainer.getIt();
  GeneralStates generalState = GeneralStates.init;

  /// Controllers
  final TextEditingController searchTextController = TextEditingController();
  final PageController mainScreenPageController = PageController();

  /// Data
  // User? user;
  ThemeMode currentThemeMode = ThemeMode.system;
  List<Widget> tabs = [
    const HomeTab(),
    Center(
      child: Text(
        'Wishlist',
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 24.sp,
        ),
      ),
    ),
    Center(
      child: Text(
        'Cart',
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 24.sp,
        ),
      ),
    ),
    Center(
      child: Text(
        'Search',
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 24.sp,
        ),
      ),
    ),
    const ProfileTab(),
  ];

  /// variables
  bool isInitMain = false;
  int currentTab = 0;
  double totalBalance = 0;
  String title = '';

  void initMain() {
    // if (isInitMain) return;
    final accessToken = InjectionContainer.getIt<CacheService>().getData<String>(
      key: AppKeys.accessToken,
    );
    InjectionContainer.getIt<CacheService>().getData<String>(
      key: AppKeys.refreshToken,
    );
    final themeMode = InjectionContainer.getIt<CacheService>().getData<String>(
      key: AppKeys.currentThemeMode,
    );
    if (themeMode != null) {
      currentThemeMode = themeMode == 'dark' ? ThemeMode.dark : ThemeMode.light;
    }
    if (accessToken != null) {
      getUser();
    }
    // isInitMain = true;
  }

  Future<void> getUser() async {
    // InjectionContainer.getIt<Logger>().i("Start `getUser` in |MainCubit|");
    // generalState = GeneralStates.loading;
    // _update(const MainState.loading());
    // final result = await getUserUseCase();
    // result.fold(
    //   (l) {
    //     // generalState = StateManagerService.getStateFromFailure(l);
    //     _update(MainState.error(l.message));
    //   },
    //   (user) {
    //     generalState = GeneralStates.success;
    //     this.user = user;
    //     if (user != null) {
    //       if (user.status == UserStatus.active) {
    //         if (user.role == UserRole.admin) {
    //           tabs = [
    //             const AdminHomeTab(),
    //             const ClientsTab(),
    //             const ActivitiesTab(),
    //             const AdminTransactionsTab(),
    //             const SettingsTab(),
    //           ];
    //         } else {
    //           tabs = [
    //             const ClientHomeTab(),
    //             const AccountsTab(),
    //             const HotlineTab(),
    //             const ClientTransactionsTab(),
    //             const SettingsTab(),
    //           ];
    //           title = '#${user.id ?? LocaleKeys.nothing.tr()} ${user.firstName ?? ''} ${user.lastName ?? ''}';
    //         }
    //       } else {
    //         InjectionContainer.getIt<RouterService>().router.go(
    //               AppRoutes.verifyIdentityScreen,
    //             );
    //       }
    //     }
    //     currentTab = 0;
    //     _update(MainState.loaded(user));
    //   },
    // );
    // InjectionContainer.getIt<Logger>().w(
    //   "End `getUser` in |MainCubit| General State:$generalState role:${user?.id}",
    // );
  }

  Future<void> logout() async {
    // InjectionContainer.getIt<Logger>().i("Start `logout` in |MainCubit|");
    // _update(const MainState.loading());
    // generalState = GeneralStates.loading;
    // var result = await logoutUseCase();
    // result.fold(
    //   (l) {
    //     generalState = StateManagerService.getStateFromFailure(l);
    //     currentTab = 0;
    //     _update(MainState.error(l.message));
    //   },
    //   (r) {
    //     _update(const MainState.logoutSuccess());
    //     generalState = GeneralStates.success;
    //     currentTab = 0;
    //     RouterService.setInitialRoute(AppRoutes.signInScreen);
    //   },
    // );
    // InjectionContainer.getIt<Logger>().w(
    //   "End `logout` in |MainCubit| General State:$generalState",
    // );
  }

  void changeCurrentTab(int index) {
    _update(const MainState.loading());
    currentTab = index;
    mainScreenPageController.animateToPage(
      currentTab,
      duration: const Duration(milliseconds: 1),
      curve: Curves.easeIn,
    );
    _update(const MainState.changeTabSuccess());
  }

  void changeCurrentPage(int index) {
    _update(const MainState.loading());
    currentTab = index;
    _update(const MainState.changeTabSuccess());
  }

  void enableDarkMode(bool isDarkMode) {
    _update(const MainState.loading());
    InjectionContainer.getIt<CacheService>().setData(
      key: AppKeys.currentThemeMode,
      value: isDarkMode ? 'dark' : 'light',
    );
    currentThemeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    _update(const MainState.changeTabSuccess());
  }

  void _update(MainState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
