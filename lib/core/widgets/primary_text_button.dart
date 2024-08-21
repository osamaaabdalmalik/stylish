import 'package:stylish/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryTextButton extends StatelessWidget {
  final String label;
  final Color? labelColor;
  final Color backgroundColor;
  final FontWeight fontWeight;
  final double? fontSize;
  final void Function()? onPressed;

  const PrimaryTextButton({
    required this.label,
    this.labelColor,
    this.backgroundColor = AppColors.transparent,
    this.fontWeight = FontWeight.w700,
    this.fontSize,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(5.r),
      child: Container(
        padding: EdgeInsets.all(5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: backgroundColor,
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: labelColor,
                fontWeight: fontWeight,
                fontSize: fontSize ?? 16.sp,
              ),
        ),
      ),
    );
  }
}
