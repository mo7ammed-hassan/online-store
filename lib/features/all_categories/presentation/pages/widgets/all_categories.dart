import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/cubits/categories/categories_display_cubit.dart';
import 'package:online_store/common/cubits/categories/categories_display_state.dart';
import 'package:online_store/common/widgets/category/all_categories_list.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        }
        if (state is CategoriesLoaded) {
          return AllCategoriesList(categories: state.categories);
        }
        return Container();
      },
    );
  }
}
