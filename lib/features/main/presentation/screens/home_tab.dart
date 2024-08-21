import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/core/constants/app_colors.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final CarouselController controller = CarouselController();
  int currentIndex = 1;
  bool isRent = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.h,
              ),
              // CarouselSlider(
              //   carouselController: controller,
              //   options: CarouselOptions(
              //     height: 175.h,
              //     viewportFraction: 16 / 9,
              //     autoPlay: true,
              //     onPageChanged: (index, reason) {
              //       setState(() {
              //         currentIndex = index;
              //       });
              //     },
              //   ),
              //   items: List.generate(
              //     4,
              //     (index) => CarImageCard(
              //       imagePath: '${AppAssets.rootImages}/car${index % 4}.png',
              //     ),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => GestureDetector(
                    onTap: () => controller.animateToPage(index),
                    child: Container(
                      width: 8,
                      height: 8,
                      margin: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 4.0.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.materialPrimary.shade200.withOpacity(
                          currentIndex == index ? 0.9 : 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
