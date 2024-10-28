import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/all_categories/presentation/pages/all_categories_page.dart';
import 'package:online_store/common/cubits/categories/categories_display_cubit.dart';
import 'package:online_store/features/home/presentation/pages/widgets/categories_list_view.dart';
import 'package:online_store/features/home/presentation/pages/widgets/see_all_widget.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDisplayCubit()..dispalyCategories(),
      child: Column(
        children: [
          _seeAll(context),
          const SizedBox(height: AppPadding.defaultSpaceWidget),
          const Categories(),
        ],
      ),
    );
  }

  Widget _seeAll(BuildContext context) {
    return SeeAllWidget(
      title: 'Categories',
      onTap: () {
        context.push(const AllCategoriesPage());
      },
    );
  }
}
