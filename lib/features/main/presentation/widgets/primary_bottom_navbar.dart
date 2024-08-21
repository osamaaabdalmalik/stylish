// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/core/constants/app_assets.dart';
import 'package:stylish/core/constants/app_colors.dart';

class PrimaryBottomNavbar extends StatelessWidget {
  final int currentTab;
  final void Function(int) changeCurrentTab;

  const PrimaryBottomNavbar({
    super.key,
    required this.currentTab,
    required this.changeCurrentTab,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.r),
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.black30,
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: currentTab,
          onTap: changeCurrentTab,
          selectedLabelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: AppColors.white,
              ),
          unselectedLabelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: AppColors.black10,
              ),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.white,
          backgroundColor: AppColors.secondary,
          useLegacyColorScheme: true,
          items: [
            BottomNavigationBarItem(
              icon: NavItem(
                isSelected: currentTab == 0,
                iconPath: AppAssets.filter,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: NavItem(
                isSelected: currentTab == 1,
                iconPath: AppAssets.filter,
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Column(),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: NavItem(
                isSelected: currentTab == 3,
                iconPath: AppAssets.filter,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: NavItem(
                isSelected: currentTab == 4,
                iconPath: AppAssets.filter,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final bool isSelected;
  final String iconPath;

  const NavItem({super.key, required this.isSelected, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isSelected)
          Container(
            height: 10,
            width: 10,
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
          ),
        SizedBox(
          height: 10.w,
        ),
        SvgPicture.asset(
          iconPath,
          height: 28.w,
          color: isSelected ? AppColors.white : AppColors.white.withOpacity(0.5),
        ),
      ],
    );
  }
}
