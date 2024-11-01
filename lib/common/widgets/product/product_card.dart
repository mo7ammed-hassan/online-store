import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/common/helper/images/image_display.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';
import 'package:online_store/features/product_detail.dart/presentation/pages/product_detail_page.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(ProductDetailPage(
          product: product,
        ));
      },
      child: AspectRatio(
        aspectRatio: 175 / 283,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.fillColorLightMode,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: CachedNetworkImageProvider(
                        ImageDisplayHelper.generateProductImageURL(
                          product.images[0],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        maxLines: 1,
                        style: AppTextStyle.textStyle14,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Text(
                            product.discountedPrice == 0
                                ? '\$${product.price}'
                                : '\$${product.discountedPrice}',
                            style: AppTextStyle.textStyle14
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 14),
                          Text(
                            product.discountedPrice == 0
                                ? ''
                                : '\$${product.price}',
                            style: AppTextStyle.textStyle14.copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.hintTextColorLightMode,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: AppColors.hintTextColorLightMode,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
