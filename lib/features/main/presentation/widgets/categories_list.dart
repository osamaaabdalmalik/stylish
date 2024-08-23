import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/core/constants/app_colors.dart';

class CategoriesList extends StatelessWidget {
  final List<String> categories = [
    'Beauty',
    'Fashion',
    'Kids',
    'Men',
  ];

  CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
            child: Row(
              children: [
                VerticalDivider(
                  color: AppColors.primary,
                  width: 10.w,
                ),
                Text(
                  'Category',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 110.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Column(
              children: [
                Image.asset(
                  'assets/images/cat${index % 4}.png',
                  height: 65.h,
                  width: 65.h,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  categories[index % categories.length],
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                )
              ],
            ),
            separatorBuilder: (context, index) => SizedBox(
              width: 15.w,
            ),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
