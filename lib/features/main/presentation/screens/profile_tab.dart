import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/core/constants/app_assets.dart';
import 'package:stylish/core/constants/app_colors.dart';
import 'package:stylish/core/constants/app_routes.dart';
import 'package:stylish/core/widgets/primary_button.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: Text(
                  'Profile',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Image.asset(
                AppAssets.profileImage1,
                width: 100,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
                decoration: BoxDecoration(
                  color: AppColors.gray.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello User Name",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                "Name",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                "User name",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(height: 20.h,),
                              Text(
                                "Email",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                "info@gmail.com",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(height: 20.h,),
                              Text(
                                "Phone number",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                "+963987654321",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          AppAssets.profileIllustration,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: PrimaryButton(
              label: 'Log out',
              onPressed: () {
                context.go(AppRoutes.signInScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}
