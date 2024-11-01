import 'package:flutter/material.dart';
import 'package:online_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';
import 'package:online_store/features/product_detail.dart/presentation/pages/widgets/add_to_bag.dart';
import 'package:online_store/features/product_detail.dart/presentation/pages/widgets/product_color.dart';
import 'package:online_store/features/product_detail.dart/presentation/pages/widgets/product_images_list.dart';
import 'package:online_store/features/product_detail.dart/presentation/pages/widgets/product_price.dart';
import 'package:online_store/features/product_detail.dart/presentation/pages/widgets/product_quantity.dart';
import 'package:online_store/features/product_detail.dart/presentation/pages/widgets/product_title.dart';
import 'package:online_store/features/product_detail.dart/presentation/pages/widgets/selected_size.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: false,
        action: Container(
          height: 50,
          width: 50,
          margin: const EdgeInsets.only(right: 10),
          decoration: const BoxDecoration(
            color: AppColors.fillColorLightMode,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline_rounded),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.verticalPagePadding / 2,
          horizontal: AppPadding.horizontalPagePadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImagesList(product: product),
            const SizedBox(height: AppPadding.defaultSpaceWidget),
            ProductTitle(product: product),
            const SizedBox(height: AppPadding.defaultSpaceWidget / 2),
            ProductPrice(product: product),
            const SizedBox(height: AppPadding.defaultSpaceWidget * 2),
            SelectedSize(product: product),
            const SizedBox(height: AppPadding.horizontalPagePadding),
            SelectedColor(product: product),
            const SizedBox(height: AppPadding.horizontalPagePadding),
            ProductQuantity(product: product),
            const SizedBox(height: AppPadding.horizontalPagePadding),
          ],
        ),
      ),
      bottomNavigationBar: const AddToBag(),
    );
  }
}
