import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/core/constants/app_colors.dart';
import 'package:stylish/core/widgets/primary_icon_button.dart';

class PrimaryAppbar extends StatelessWidget {
  final String title;

  const PrimaryAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              PrimaryIconButton(
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColors.secondary,
                  size: 20.w,
                ),
                color: AppColors.white10,
                borderRadius: BorderRadius.circular(10.r),
                padding: EdgeInsets.all(5.w),
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Row(
            children: [
              PrimaryIconButton(
                icon: Icon(
                  Icons.search_rounded,
                  color: AppColors.transparent,
                  size: 35.h,
                ),
                color: AppColors.transparent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
