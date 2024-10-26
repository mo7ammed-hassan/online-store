import 'package:flutter/material.dart';
import 'package:online_store/common/widgets/product/product_card.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.35,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const ProductCard(),
        separatorBuilder: (context, index) => const SizedBox(
          width: 14,
        ),
        itemCount: 5,
      ),
    );
  }
}
