import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/core/constants/app_assets.dart';
import 'package:stylish/core/constants/app_colors.dart';
import 'package:stylish/core/widgets/primary_button.dart';

class DealOfDayCard extends StatelessWidget {
  const DealOfDayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.blue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Deal of the Day',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.white,
                    ),
              ),
              SizedBox(
                height: 10.w,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.timer,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    '22h 55m 20s remaining ',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: AppColors.white,
                          height: 0.95,
                        ),
                  ),
                ],
              ),
            ],
          ),
          PrimaryButton(
            label: 'View all',
            isOutlined: true,
            backgroundColor: AppColors.white,
            prefixIcon: Icons.arrow_forward,
            labelColor: AppColors.white,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            margin: EdgeInsets.zero,
            fontSize: 14.sp,
            borderRadius: BorderRadius.circular(8.r),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
