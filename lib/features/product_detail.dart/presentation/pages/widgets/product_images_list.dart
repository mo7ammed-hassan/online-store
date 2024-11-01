import 'package:flutter/material.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';
import 'package:online_store/features/product_detail.dart/presentation/pages/widgets/product_image_card.dart';

class ProductImagesList extends StatelessWidget {
  final ProductEntity product;
  const ProductImagesList({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
          return ProductImageCard(imageURL: product.images[index]);
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: product.images.length,
      ),
    );
  }
}
