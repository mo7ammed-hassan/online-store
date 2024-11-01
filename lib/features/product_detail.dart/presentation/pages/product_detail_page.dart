import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';
import 'package:online_store/features/product_detail.dart/cubits/product_quantity_cubit.dart';
import 'package:online_store/features/product_detail.dart/presentation/pages/widgets/add_to_bag.dart';
import 'package:online_store/features/product_detail.dart/presentation/pages/widgets/product_detail_body.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductQuantityCubit(),
        ),
      ],
      child: Scaffold(
        appBar: _appBar(),
        body: ProductDetailBody(product: product),
        bottomNavigationBar: const AddToBag(),
      ),
    );
  }

  BasicAppBar _appBar() {
    return BasicAppBar(
      hideBack: false,
      action: Container(
        height: 50,
        width: 50,
        margin: const EdgeInsets.only(right: 10),
        decoration: const BoxDecoration(
          color: AppColors.fillColorLightMode,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_outline_rounded),
        ),
      ),
    );
  }
}
