import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/all_categories/presentation/pages/widgets/all_categories.dart';
import 'package:online_store/common/cubits/categories/categories_display_cubit.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: false,
        arrowBackOnTap: () {
          context.pop();
        },
      ),
      body: BlocProvider(
        create: (context) => CategoriesDisplayCubit()..dispalyCategories(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.horizontalPagePadding,
            vertical: AppPadding.horizontalPagePadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _shopByCategories(),
              const SizedBox(height: AppPadding.defaultSpaceWidget),
              const AllCategories(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _shopByCategories() {
    return const Text(
      'Shop by Categories',
      style: AppTextStyle.textStyle24,
    );
  }
}
