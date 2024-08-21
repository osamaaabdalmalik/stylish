import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/core/constants/app_assets.dart';
import 'package:stylish/core/constants/app_colors.dart';
import 'package:stylish/core/constants/app_routes.dart';
import 'package:stylish/core/widgets/primary_loader.dart';
import 'package:stylish/features/main/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:stylish/features/main/presentation/widgets/primary_bottom_navbar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        state.mapOrNull(
          logoutSuccess: (value) {
            context.go(AppRoutes.signInScreen);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Scaffold(
            body: PrimaryLoader(),
          ),
          orElse: () => Scaffold(
            body: PageView(
              controller: context.read<MainCubit>().mainScreenPageController,
              onPageChanged: context.read<MainCubit>().changeCurrentPage,
              physics: const NeverScrollableScrollPhysics(),
              children: context.read<MainCubit>().tabs,
            ),
            bottomNavigationBar: PrimaryBottomNavbar(
              currentTab: context.read<MainCubit>().currentTab,
              changeCurrentTab: context.read<MainCubit>().changeCurrentTab,
            ),
            floatingActionButton: Transform.translate(
              offset: Offset(0, 40.h),
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: AppColors.white.withOpacity(0.6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: SvgPicture.asset(AppAssets.image),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          ),
        );
      },
    );
  }
}
