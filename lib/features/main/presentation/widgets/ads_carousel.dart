import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/core/constants/app_assets.dart';
import 'package:stylish/core/constants/app_colors.dart';
import 'package:stylish/core/widgets/primary_button.dart';

class AdsCarousel extends StatefulWidget {
  const AdsCarousel({super.key});

  @override
  State<AdsCarousel> createState() => _AdsCarouselState();
}

class _AdsCarouselState extends State<AdsCarousel> {
  final CarouselController adsController = CarouselController();
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: adsController,
          options: CarouselOptions(
            height: 160.h,
            viewportFraction: 3,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          items: List.generate(
            3,
            (index) => SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              child: Stack(
                children: [
                  Positioned.fill(
                    top: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                            AppAssets.backgroundCard,
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.only(start: 15.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '50-40% OFF',
                                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                            color: AppColors.white,
                                          ),
                                    ),
                                    Text(
                                      'Now\nin (product)',
                                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                            color: AppColors.white,
                                            height: 0.95,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      'All colours',
                                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                            color: AppColors.white,
                                          ),
                                    ),
                                  ],
                                ),
                                PrimaryButton(
                                  label: 'Shop Now',
                                  isOutlined: true,
                                  backgroundColor: AppColors.white,
                                  prefixIcon: Icons.arrow_forward,
                                  labelColor: AppColors.white,
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  margin: EdgeInsets.zero,
                                  fontSize: 14.sp,
                                  borderRadius: BorderRadius.circular(15.r),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -5,
                    child: SvgPicture.asset(
                      AppAssets.curveCard,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => GestureDetector(
              onTap: () => adsController.animateToPage(index),
              child: Container(
                width: 10.w,
                height: 10.w,
                margin: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 4.0.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == index ? AppColors.primary.withOpacity(0.5) : AppColors.gray.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
