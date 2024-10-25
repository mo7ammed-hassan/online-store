import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/home/presentation/cubits/categories/categories_display_cubit.dart';
import 'package:online_store/features/home/presentation/pages/widgets/categories_list_view.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDisplayCubit()..dispalyCategories(),
      child: Column(
        children: [
          _seeAll(),
          const SizedBox(height: AppPadding.defaultSpaceWidget),
          const Categories(),
        ],
      ),
    );
  }

  Widget _seeAll() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Categories',
          style: AppTextStyle.textStyle18Bold,
        ),
        GestureDetector(
          onTap: () {},
          child: const Text('See All', style: AppTextStyle.textStyle16),
        ),
      ],
    );
  }
}
