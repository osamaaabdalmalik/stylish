// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/core/constants/app_assets.dart';
import 'package:stylish/core/constants/app_colors.dart';
import 'package:stylish/core/widgets/primary_icon_button.dart';

class ProductCard extends StatelessWidget {
  final bool isFavorite;

  const ProductCard({
    super.key,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.h,
      margin: EdgeInsetsDirectional.only(start: 15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.sp),
        color: AppColors.gray.withOpacity(0.05),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12.sp),
                    ),
                    image: const DecorationImage(
                      image: AssetImage(
                        AppAssets.product,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Women Printed Kurta",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 12.sp,
                          ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Neque porro quisquam est qui dolorem ipsum quia",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 10.sp,
                          ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "\$1500",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 12.sp,
                          ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "\$2499",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.gray.withOpacity(0.6),
                                decorationColor: AppColors.gray.withOpacity(0.6),
                                decoration: TextDecoration.lineThrough,
                              ),
                        ),
                        Text(
                          "  40%Off",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontSize: 10.sp,
                                color: AppColors.materialPrimary.shade300,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        ...List.generate(
                          4,
                          (index) => Icon(
                            Icons.star,
                            color: AppColors.warning,
                            size: 13.w,
                          ),
                        ),
                        Icon(
                          Icons.star_half,
                          color: AppColors.gray.withOpacity(0.6),
                          size: 13.w,
                        ),
                        Text(
                          " 56890",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontSize: 10.sp,
                                color: AppColors.gray.withOpacity(0.6),
                              ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 10.h,
            right: 10.h,
            child: PrimaryIconButton(
              icon: SvgPicture.asset(
                AppAssets.wishlist,
                height: 20.h,
                width: 20.h,
                color: AppColors.white.withOpacity(0.7),
              ),
              color: isFavorite ? AppColors.danger.withOpacity(0.5) : AppColors.gray.withOpacity(0.5),
              borderRadius: BorderRadius.circular(50.r),
              padding: EdgeInsets.all(5.w),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
