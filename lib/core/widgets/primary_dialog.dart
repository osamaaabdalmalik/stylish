import 'package:stylish/core/constants/app_colors.dart';
import 'package:stylish/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryDialog extends StatelessWidget {
  final String? title;
  final String? buttonLabel;
  final Color color;
  final List<Widget> children;
  final void Function()? onTap;

  const PrimaryDialog({
    this.title,
    this.buttonLabel,
    this.color = AppColors.primary,
    this.children = const [],
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      child: ListView(
        padding: EdgeInsets.only(top: 40.h, bottom: 20.h),
        shrinkWrap: true,
        children: [
          if (title != null) ...[
            Text(
              title!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 15.h,
            ),
          ],
          ...children,
          if (buttonLabel != null)
            Padding(
              padding: EdgeInsets.only(top: 40.h, bottom: 10.h),
              child: PrimaryButton(
                label: buttonLabel!,
                onPressed: onTap,
                width: double.infinity,
              ),
            ),
        ],
      ),
    );
  }
}
