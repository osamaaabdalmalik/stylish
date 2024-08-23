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
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: changeCurrentTab,
        selectedLabelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: AppColors.primary,
            ),
        unselectedLabelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: AppColors.gray,
            ),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        backgroundColor: AppColors.white,
        useLegacyColorScheme: true,
        items: [
          BottomNavigationBarItem(
            icon: NavItem(
              isSelected: currentTab == 0,
              iconPath: AppAssets.home,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: NavItem(
              isSelected: currentTab == 1,
              iconPath: AppAssets.wishlist,
            ),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: NavItem(
              isSelected: currentTab == 2,
              iconPath: AppAssets.cart,
              isHidden: true,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: NavItem(
              isSelected: currentTab == 3,
              iconPath: AppAssets.search,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: NavItem(
              isSelected: currentTab == 4,
              iconPath: AppAssets.profile,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final bool isSelected;
  final bool isHidden;
  final String iconPath;

  const NavItem({
    super.key,
    required this.isSelected,
    required this.iconPath,
    this.isHidden = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: SvgPicture.asset(
        iconPath,
        height: 28.w,
        color: isHidden
            ? AppColors.transparent
            : isSelected
                ? AppColors.primary
                : AppColors.gray,
      ),
    );
  }
}
