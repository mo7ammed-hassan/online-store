import 'package:flutter/material.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';

class ProductTitle extends StatelessWidget {
  final ProductEntity product;
  const ProductTitle({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Text(
      product.title,
      style: AppTextStyle.textStyle18ExtraBold,
    );
  }
}
