import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/widgets/product/product_card.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';
import 'package:online_store/features/home/presentation/cubits/product/top_selling_display_cubit.dart';
import 'package:online_store/features/home/presentation/cubits/product/top_selling_display_state.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopSellingDisplayCubit, TopSellingDisplayState>(
      builder: (context, state) {
        if (state is TopSellingLoading) {
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        }
        if (state is TopSellingLoaded) {
          return _topSellingListView(context, products: state.products);
        }
        return const SizedBox();
      },
    );
  }

  Widget _topSellingListView(BuildContext context,
      {required List<ProductEntity> products}) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.35,
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
