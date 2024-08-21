import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/core/constants/app_colors.dart';

class PrimarySelectItem<T> extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final bool isExpanded;
  final bool readOnly;
  final List<DropdownMenuItem<T>> items;
  final T? selectedItem;
  final void Function(T? value)? onChanged;
  final Widget? suffixIcon;
  final Color fillColor;
  final EdgeInsetsGeometry? padding;

  const PrimarySelectItem({
    super.key,
    this.labelText,
    this.hintText,
    this.readOnly = false,
    required this.onChanged,
    required this.items,
    required this.selectedItem,
    this.suffixIcon,
    this.fillColor = AppColors.secondary,
    this.padding,
    this.isExpanded = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null) ...[
            Text(
              labelText!,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
          ],
          DropdownButtonHideUnderline(
            child: DropdownButton2<T>(
              isExpanded: isExpanded,
              hint: hintText != null
                  ? Text(
                      hintText!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 20.sp,
                          ),
                    )
                  : null,
              items: items,
              value: selectedItem,
              onChanged: readOnly ? null : onChanged,
              iconStyleData: IconStyleData(
                icon: Padding(
                  padding: EdgeInsetsDirectional.symmetric(vertical: 30.h).copyWith(end: 25.w),
                  child: suffixIcon ??
                      Icon(
                        Icons.arrow_drop_down_rounded,
                        size: 30.w,
                        color: AppColors.white,
                      ),
                ),
              ),
              buttonStyleData: ButtonStyleData(
                decoration: BoxDecoration(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(
                    color: AppColors.materialPrimary.shade100,
                    width: 1.5,
                  ),
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                offset: Offset(0, -10.h),
              ),
              menuItemStyleData: MenuItemStyleData(
                height: 70.h,
                selectedMenuItemBuilder: (context, child) {
                  return Column(
                    children: [
                      child,
                      Divider(
                        color: AppColors.materialPrimary.shade100,
                        height: 30,
                        thickness: 2,
                        endIndent: 20.w,
                        indent: 20.w,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
