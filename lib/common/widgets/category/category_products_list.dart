import 'package:flutter/material.dart';
import 'package:online_store/common/widgets/product/product_card.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';

class CategoryProductsList extends StatelessWidget {
  final List<ProductEntity> categoryProducts;
  const CategoryProductsList({
    super.key,
    required this.categoryProducts,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: categoryProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: AppPadding.defaultSpaceWidget,
          crossAxisSpacing: AppPadding.defaultSpaceWidget,
          childAspectRatio: 161 / 281,
        ),
        itemBuilder: (context, index) {
          return ProductCard(
            product: categoryProducts[index],
          );
        },
      ),
    );
  }
}
