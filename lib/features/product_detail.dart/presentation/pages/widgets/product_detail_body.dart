import 'package:flutter/widgets.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';
import 'package:online_store/features/product_detail.dart/presentation/pages/widgets/product_images_list.dart';
import 'package:online_store/features/product_detail.dart/presentation/pages/widgets/selected_colors.dart';
import 'package:online_store/features/product_detail.dart/presentation/pages/widgets/product_price.dart';
import 'package:online_store/features/product_detail.dart/presentation/pages/widgets/product_quantity.dart';
import 'package:online_store/features/product_detail.dart/presentation/pages/widgets/product_title.dart';
import 'package:online_store/features/product_detail.dart/presentation/pages/widgets/selected_size.dart';

class ProductDetailBody extends StatelessWidget {
  final ProductEntity product;
  const ProductDetailBody({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
        ],
      ),
    );
  }
}
