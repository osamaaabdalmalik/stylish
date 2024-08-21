import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/core/constants/app_colors.dart';

class CarSmallImageCard extends StatelessWidget {
  final String imagePath;
  final bool isSelected;
  final void Function()? onTap;

  const CarSmallImageCard({
    super.key,
    required this.imagePath,
    this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.w,
      width: 65.w,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: Material(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.circular(8.sp),
        child: InkWell(
          onTap: onTap,
          splashColor: AppColors.materialPrimary.shade50.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8.sp),
          child: Container(
            color: AppColors.materialPrimary.shade200.withOpacity(
              isSelected ? 0 : 0.8,
            ),
            child: Ink.image(
              image: AssetImage(
                imagePath,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
