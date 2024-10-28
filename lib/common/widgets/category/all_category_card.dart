import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_store/common/helper/images/image_display.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/home/domain/entity/category/category_entity.dart';

class AllCategoryCard extends StatelessWidget {
  final CategoryEntity category;
  const AllCategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.fillColorLightMode,
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.fillColorLightMode,
              image: DecorationImage(
                fit: BoxFit.contain,
                image: CachedNetworkImageProvider(
                  ImageDisplayHelper.generateCategoryImageURL(
                    category.imageUrl,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: AppPadding.defaultSpaceWidget),
          Text(
            category.title,
            style: AppTextStyle.textStyle16,
          )
        ],
      ),
    );
  }
}
