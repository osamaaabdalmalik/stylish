import 'package:stylish/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimarySwitch extends StatefulWidget {
  final String label;
  final bool isActive;
  final void Function(bool)? onChanged;

  const PrimarySwitch({
    super.key,
    required this.label,
    required this.isActive,
    this.onChanged,
  });

  @override
  State<PrimarySwitch> createState() => _PrimarySwitchState();
}

class _PrimarySwitchState extends State<PrimarySwitch> {
  late bool isActive;

  @override
  void initState() {
    isActive = widget.isActive;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.label),
          Switch(
            value: isActive,
            activeColor: Theme.of(context).canvasColor,
            inactiveThumbColor: AppColors.white,
            inactiveTrackColor: AppColors.black10,
            activeTrackColor: AppColors.primary,
            onChanged: (value) {
              setState(() {
                isActive = !isActive;
                widget.onChanged?.call(isActive);
              });
            },
          ),
        ],
      ),
    );
  }
}
