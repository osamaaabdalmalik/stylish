import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/core/constants/app_assets.dart';
import 'package:stylish/core/constants/app_colors.dart';
import 'package:stylish/core/widgets/primary_button.dart';
import 'package:stylish/core/widgets/primary_text_button.dart';
import 'package:stylish/core/widgets/primary_text_field.dart';
import 'package:stylish/features/main/presentation/widgets/sign_in_curve.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomPaint(
            size: Size(360.w, 195.h),
            painter: SignInCurvePainter(),
          ),
          Transform.translate(
            offset: Offset(0, -20.h),
            child: Center(
              child: Text(
                'Welcome Back!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          PrimaryTextField(
            hintText: 'Username or Email',
            prefixIcon: Padding(
              padding: EdgeInsets.all(10.w),
              child: SvgPicture.asset(AppAssets.username),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          PrimaryTextField(
            hintText: 'Password',
            prefixIcon: Padding(
              padding: EdgeInsets.all(10.w),
              child: SvgPicture.asset(AppAssets.password),
            ),
            isObscureText: true,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PrimaryTextButton(
                  label: 'Forgot Password?',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  labelColor: AppColors.primary,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 150.h,
          ),
          PrimaryButton(
            label: 'Login',
            onPressed: () {},
          ),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create An Account',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                PrimaryTextButton(
                  label: 'Sign Up',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  labelColor: AppColors.primary,
                  hasUnderLine: true,
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
