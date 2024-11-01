import 'package:flutter/material.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';

class ProductPrice extends StatelessWidget {
  final ProductEntity product;
  const ProductPrice({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Text(
      product.discountedPrice != 0
          ? '\$${product.discountedPrice}'
          : '\$${product.price}',
      style:
          AppTextStyle.textStyle16Black.copyWith(color: AppColors.primaryColor),
    );
  }
}
