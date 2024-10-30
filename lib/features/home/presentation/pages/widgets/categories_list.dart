import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/helper/images/image_display.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/home/domain/entity/category/category_entity.dart';
import 'package:online_store/common/cubits/categories/categories_display_cubit.dart';
import 'package:online_store/common/cubits/categories/categories_display_state.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

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
          return _categoriesList(state.categories);
        }
        return Container();
      },
    );
  }

  SizedBox _categoriesList(List<CategoryEntity> categories) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        //clipBehavior: Clip.none,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        separatorBuilder: (context, index) =>
            const SizedBox(width: AppPadding.defaultSpaceWidget / 2),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return _categoryCard(category: categories[index]);
        },
      ),
    );
  }

  Widget _categoryCard({required CategoryEntity category}) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.fillColorLightMode,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: CachedNetworkImageProvider(
                ImageDisplayHelper.generateCategoryImageURL(category.imageUrl),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          category.title,
          style: AppTextStyle.textStyle15,
        ),
      ],
    );
  }
}
