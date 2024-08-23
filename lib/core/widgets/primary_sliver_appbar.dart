import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/core/constants/app_colors.dart';

class PrimarySliverAppbar extends StatelessWidget {
  final Widget sliverFixedTopPart;
  final Widget? sliverBottom;
  final EdgeInsetsGeometry? sliverBottomPadding;
  final double? expandedHeight;
  final bool pinned;

  const PrimarySliverAppbar({
    super.key,
    required this.sliverFixedTopPart,
    this.sliverBottom,
    this.sliverBottomPadding,
    this.expandedHeight,
    this.pinned = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: expandedHeight ?? 130.h,
      pinned: pinned,
      floating: true,
      snap: true,
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.white,
      leading: const SizedBox(),
      leadingWidth: 0,
      title: Container(
        color: AppColors.white,
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Stack(
          children: [
            Positioned(
              child: sliverFixedTopPart,
            ),
          ],
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: sliverBottom,
        titlePadding: sliverBottomPadding ??
            EdgeInsets.symmetric(
              vertical: 5.h,
            ),
        expandedTitleScale: 1,
      ),
    );
  }
}
