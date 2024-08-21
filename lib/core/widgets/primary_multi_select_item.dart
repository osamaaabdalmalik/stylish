import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:stylish/core/constants/app_colors.dart';
import 'package:stylish/core/translations/local_keys.g.dart';
import 'package:stylish/core/widgets/primary_text_field.dart';

class PrimaryMultiSelectItem<T> extends StatelessWidget {
  final String labelText;
  final String hintText;
  final List<MultiSelectItem<T>> allItems;
  final List<MultiSelectItem<T>> selectedItems;
  final List<T> selectedItemsValue;
  final void Function(List<T> values) onChanged;
  final FormFieldValidator? validator;
  final Widget? suffixIcon;

  const PrimaryMultiSelectItem({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.onChanged,
    required this.allItems,
    required this.selectedItems,
    required this.selectedItemsValue,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (selectedItemsValue.isEmpty)
            PrimaryTextField(
              labelText: labelText,
              padding: EdgeInsets.zero,
              hintText: hintText,
              validator: validator,
              suffixIcon: suffixIcon ??
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors.gray,
                  ),
              onTap: () async {
                await showDialogSelect(context);
              },
            ),
          InkWell(
            onTap: () async {
              await showDialogSelect(context);
            },
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            child: MultiSelectChipDisplay<T>(
              alignment: Alignment.centerRight,
              // Get.locale!.languageCode == 'ar' ? Alignment.centerRight : Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
              ),
              scroll: false,
              textStyle: const TextStyle(fontSize: 14),
              onTap: (p0) async {
                await showDialogSelect(context);
              },
              items: selectedItems,
            ),
          ),
        ],
      ),
    );
  }

  showDialogSelect(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => MultiSelectDialog<T>(
        confirmText: Text(LocaleKeys.confirm.tr()),
        cancelText: Text(LocaleKeys.ignore.tr()),
        title: Text(hintText),
        selectedColor: AppColors.primary,
        height: 500.h,
        items: allItems,
        initialValue: selectedItemsValue,
        onConfirm: onChanged,
      ),
    );
  }
}
//
// class Pair {
//   int id;
//   String name;
//
//   Pair({
//     required this.id,
//     required this.name,
//   });
// }
