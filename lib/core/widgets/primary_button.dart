import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/core/constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final double? width;
  final Color backgroundColor;
  final Color labelColor;
  final IconData? prefixIcon;
  final bool isOutlined;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final void Function()? onPressed;

  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.width,
    this.prefixIcon,
    this.isOutlined = false,
    this.backgroundColor = AppColors.primary,
    this.labelColor = AppColors.white,
    this.padding,
    this.fontSize,
    this.margin,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: margin ?? EdgeInsets.symmetric(horizontal: 25.w),
      child: MaterialButton(
        onPressed: onPressed,
        color: isOutlined ? AppColors.transparent : backgroundColor,
        disabledColor: AppColors.gray.withOpacity(0.5),
        padding: padding ?? EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          side: isOutlined ? BorderSide(color: labelColor) : BorderSide.none,
        ),
        elevation: isOutlined ? 0 : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: labelColor,
                    fontWeight: FontWeight.w700,
                    fontSize: fontSize,
                  ),
            ),
            if (prefixIcon != null) ...[
              Icon(
                prefixIcon,
                color: AppColors.white,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
