import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/cubits/product/products_display_cubit.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/home/domain/use_case.dart/product/get_top_selling_use_case.dart';
import 'package:online_store/features/home/presentation/pages/widgets/see_all_widget.dart';
import 'package:online_store/features/home/presentation/pages/widgets/top_selling_products.dart';

class TopSellingSection extends StatelessWidget {
  const TopSellingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsDisplayCubit(useCase: GetTopSellingUseCase())
        ..displayProducts(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topSelling(context),
          const SizedBox(height: AppPadding.defaultSpaceWidget),
          const Products(),
        ],
      ),
    );
  }

  Widget _topSelling(BuildContext context) {
    return SeeAllWidget(
      title: 'Top Selling',
      onTap: () {},
    );
  }
}
