import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/core/constants/app_colors.dart';
import 'package:stylish/core/widgets/primary_icon_button.dart';
import 'package:stylish/features/main/presentation/widgets/product_card.dart';

class ProductsCarousel extends StatefulWidget {
  const ProductsCarousel({super.key});

  @override
  State<ProductsCarousel> createState() => _ProductsCarouselState();
}

class _ProductsCarouselState extends State<ProductsCarousel> {
  final CarouselController productsController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Stack(
          children: [
            CarouselSlider(
              carouselController: productsController,
              options: CarouselOptions(
                height: 300.h,
                viewportFraction: 0.55,
                padEnds: false,
                onPageChanged: (index, reason) {},
              ),
              items: List.generate(
                10,
                (index) => const ProductCard(isFavorite: true),
              ),
            ),
            Positioned(
              top: 130.h,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.gray.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: PrimaryIconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.black,
                    size: 20.w,
                  ),
                  color: AppColors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(50.r),
                  padding: EdgeInsets.all(10.w),
                  onPressed: () {
                    productsController.nextPage();
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
