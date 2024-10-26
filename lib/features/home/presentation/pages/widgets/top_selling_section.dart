import 'package:flutter/material.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/home/presentation/pages/widgets/Products_list_view.dart';
import 'package:online_store/features/home/presentation/pages/widgets/see_all_widget.dart';

class TopSellingSection extends StatelessWidget {
  const TopSellingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _topSelling(context),
        const SizedBox(height: AppPadding.defaultSpaceWidget),
        const Products(),
      ],
    );
  }

  Widget _topSelling(BuildContext context) {
    return SeeAllWidget(
      title: 'Top Selling',
      onTap: () {},
    );
  }
}
