import 'package:flutter/material.dart';
import 'package:online_store/common/widgets/product/product_card.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';

class DisplayProductListView extends StatelessWidget {
  final List<ProductEntity> products;
  const DisplayProductListView({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.36,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ProductCard(
          product: products[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 14,
        ),
        itemCount: products.length,
      ),
    );
  }
}
