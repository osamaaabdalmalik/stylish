import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/core/constants/app_assets.dart';
import 'package:stylish/core/constants/app_colors.dart';
import 'package:stylish/core/widgets/primary_icon_button.dart';
import 'package:stylish/core/widgets/primary_sliver_appbar.dart';
import 'package:stylish/features/main/presentation/cubits/main_cubit/main_cubit.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimarySliverAppbar(
      sliverFixedTopPart: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PrimaryIconButton(
              icon: Icon(
                Icons.menu,
                size: 30.w,
              ),
              onPressed: () {},
              color: AppColors.gray.withOpacity(0.05),
              borderRadius: BorderRadius.circular(30.r),
              padding: EdgeInsets.all(5.w),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: SvgPicture.asset(
                AppAssets.logoApp,
              ),
            ),
            PrimaryIconButton(
              icon: Image.asset(
                AppAssets.profileImage,
                width: 40.w,
              ),
              onPressed: () {
                context.read<MainCubit>().changeCurrentTab(4);
              },
              color: AppColors.gray,
              borderRadius: BorderRadius.circular(30.r),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
      sliverBottom: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: TextFormField(
          style: const TextStyle(
            fontSize: 14,
          ),
          cursorColor: AppColors.black,
          cursorWidth: 0.8,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: Theme.of(context).textTheme.labelMedium,
            prefixIcon: Padding(
              padding: EdgeInsets.all(12.w),
              child: SvgPicture.asset(
                AppAssets.search,
              ),
            ),
            fillColor: AppColors.gray.withOpacity(0.05),
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide.none,
            ),
          ),
          onTapOutside: (e) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
      ),
      expandedHeight: 110.h,
    );
  }
}
