import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/cubits/product/products_display_cubit.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/home/domain/use_case.dart/product/get_products_by_title_use_case.dart';
import 'package:online_store/features/search/presentation/widgets/filter_products.dart';
import 'package:online_store/features/search/presentation/widgets/search_field.dart';
import 'package:online_store/service_locator.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsDisplayCubit(
        useCase: getIt<GetProductsByTitleUseCase>(),
      ),
      child: Scaffold(
        appBar: BasicAppBar(
          arrowBacOnTap: () {
            context.pop();
          },
          hideBack: false,
          title: const SearchField(
            hideSuffixIcon: false,
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppPadding.verticalPagePadding / 2,
            horizontal: AppPadding.horizontalPagePadding,
          ),
          child: FilterProducts(),
        ),
      ),
    );
  }
}
