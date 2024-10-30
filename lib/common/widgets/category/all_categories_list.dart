import 'package:flutter/material.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/common/widgets/category/all_category_card.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/category_products/presentation/pages/category_products_page.dart';
import 'package:online_store/features/home/domain/entity/category/category_entity.dart';

class AllCategoriesList extends StatelessWidget {
  final List<CategoryEntity> categories;
  const AllCategoriesList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) =>
            const SizedBox(height: AppPadding.defaultSpaceWidget / 2),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.push(
                CategoryProductsPage(
                  category: categories[index],
                  
                ),
              );
            },
            behavior: HitTestBehavior.translucent,
            child: AllCategoryCard(
              category: categories[index],
            ),
          );
        },
        itemCount: categories.length,
      ),
    );
  }
}
