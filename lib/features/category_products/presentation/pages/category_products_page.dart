import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/cubits/product/products_display_cubit.dart';
import 'package:online_store/common/cubits/product/products_display_state.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/category_products/presentation/pages/widgets/category_products.dart';
import 'package:online_store/features/home/domain/entity/category/category_entity.dart';
import 'package:online_store/features/home/domain/use_case.dart/product/get_products_by_category_id_use_case.dart';
import 'package:online_store/service_locator.dart';

class CategoryProductsPage extends StatelessWidget {
  final CategoryEntity category;

  const CategoryProductsPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: false,
        arrowBackOnTap: () {
          context.pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.horizontalPagePadding,
          vertical: AppPadding.verticalPagePadding / 2,
        ),
        child: BlocProvider(
          create: (context) => ProductsDisplayCubit(
            useCase: getIt<GetProductsByCategoryIdUseCase>(),
          )..displayProducts(params: category.categoryId),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _categoryTitle(),
              const SizedBox(height: AppPadding.defaultSpaceWidget),
              const CategoryProducts(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryTitle() {
    return BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
      builder: (context, state) {
        final productCount =
            (state is ProductsLoaded) ? state.products.length : 0;
        return Text(
          '${category.title} ($productCount)',
          style: AppTextStyle.textStyle18Bold,
        );
      },
    );
  }
}
