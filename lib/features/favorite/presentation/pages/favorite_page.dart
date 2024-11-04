import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:online_store/common/widgets/category/category_products_list.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/favorite/presentation/cubits/get_favorites_product_cubit.dart';
import 'package:online_store/features/favorite/presentation/cubits/get_favorites_products_state.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetFavoritesProductCubit()..getFavoriteProducts(),
      child: Scaffold(
        appBar: BasicAppBar(
          hideBack: false,
          title:
              BlocBuilder<GetFavoritesProductCubit, GetFavoritesProductsState>(
            builder: (context, state) {
              final length = (state is GetFavoritesProductsLoaded)
                  ? state.products.length
                  : 0;
              return Text(
                'My Favorites ($length)',
                style: AppTextStyle.textStyle22Bold,
              );
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.horizontalPagePadding / 2,
            vertical: AppPadding.verticalPagePadding,
          ),
          child:
              BlocBuilder<GetFavoritesProductCubit, GetFavoritesProductsState>(
            builder: (context, state) {
              if (state is GetFavoritesProductsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is GetFavoritesProductsLoaded) {
                if (state.products.isEmpty) {
                  return const SizedBox();
                }
                return Column(
                  children: [
                    CategoryProductsList(categoryProducts: state.products),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
