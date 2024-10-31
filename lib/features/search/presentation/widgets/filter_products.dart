import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/cubits/product/products_display_cubit.dart';
import 'package:online_store/common/cubits/product/products_display_state.dart';
import 'package:online_store/common/widgets/category/category_products_list.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';
import 'package:online_store/features/search/presentation/widgets/not_found_state_widget.dart';
import 'package:online_store/features/search/presentation/widgets/search_filter_bar.dart';

class FilterProducts extends StatelessWidget {
  const FilterProducts({super.key});

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
          return state.products.isEmpty
              ? const NotFoundStateWidget()
              : _products(state.products);
        }
        return Container();
      },
    );
  }

  Column _products(List<ProductEntity> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchFilterBar(),
        const SizedBox(height: AppPadding.defaultSpaceWidget),
        CategoryProductsList(
          categoryProducts: products,
        ),
      ],
    );
  }
}
