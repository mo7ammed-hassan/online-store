import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/cubits/product/products_display_cubit.dart';
import 'package:online_store/common/cubits/product/products_display_state.dart';
import 'package:online_store/common/widgets/product/display_product_list_view.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        }
        if (state is ProductsLoaded) {
          return DisplayProductListView(products: state.products);
        }
        return const SizedBox();
      },
    );
  }
}
