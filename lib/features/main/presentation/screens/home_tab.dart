import 'package:flutter/material.dart';
import 'package:stylish/features/main/presentation/widgets/ads_carousel.dart';
import 'package:stylish/features/main/presentation/widgets/categories_list.dart';
import 'package:stylish/features/main/presentation/widgets/deal_of_day_card.dart';
import 'package:stylish/features/main/presentation/widgets/home_appbar.dart';
import 'package:stylish/features/main/presentation/widgets/products_carousel.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const HomeAppbar(),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              CategoriesList(),
              const AdsCarousel(),
              const DealOfDayCard(),
              const ProductsCarousel(),
            ],
          ),
        )
      ],
    );
  }
}
