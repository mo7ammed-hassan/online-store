import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/cubits/button/button_state_cubit.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:online_store/common/widgets/button/favorite_button.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';
import 'package:online_store/features/product_detail.dart/cubits/favorite_icon_cuit.dart';
import 'package:online_store/features/product_detail.dart/cubits/product_color_selection_cubit.dart';
import 'package:online_store/features/product_detail.dart/cubits/product_quantity_cubit.dart';
import 'package:online_store/features/product_detail.dart/cubits/product_size_selection_cubit.dart';
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
        BlocProvider(
          create: (context) => ProductColorsSelectionCubit(),
        ),
        BlocProvider(
          create: (context) => ProductSizeSelectionCubit(),
        ),
        BlocProvider(
          create: (context) => ButtonStateCubit(),
        ),
        BlocProvider(
          create: (context) =>
              FavoriteIconCuit()..isFavorite(product.productId),
        ),
      ],
      child: Scaffold(
        appBar: _appBar(context),
        body: ProductDetailBody(product: product),
        bottomNavigationBar: AddToBag(product: product),
      ),
    );
  }

  BasicAppBar _appBar(BuildContext context) {
    return BasicAppBar(
      hideBack: false,
      action: FavoriteButton(
        product: product,
      ),
      arrowBackOnTap: () {
        context.pop();
      },
    );
  }
}
