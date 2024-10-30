import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/cubits/product/products_display_cubit.dart';
import 'package:online_store/common/cubits/product/products_display_state.dart';
import 'package:online_store/common/widgets/category/category_products_list.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return Center(
            child: Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            ),
          );
        }
        if (state is ProductsLoaded) {
          return CategoryProductsList(
            categoryProducts: state.products,
          );
        }
        return Container();
      },
    );
  }
}
