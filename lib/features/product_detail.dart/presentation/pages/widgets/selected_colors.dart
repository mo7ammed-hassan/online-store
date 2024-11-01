import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_store/common/helper/bottom_sheet/app_bottom_sheet.dart';
import 'package:online_store/common/widgets/basic_decoration/basic_container_decoration.dart';
import 'package:online_store/core/configs/assets/app_vectors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';
import 'package:online_store/features/product_detail.dart/cubits/product_color_selection_cubit.dart';
import 'package:online_store/features/product_detail.dart/presentation/pages/widgets/product_colors.dart';

class SelectedColor extends StatelessWidget {
  final ProductEntity product;
  const SelectedColor({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.display(
          context,
          BlocProvider.value(
            value: BlocProvider.of<ProductColorsSelectionCubit>(context),
            child: ProductColors(product: product),
          ),
        );
      },
      child: BasicContainerDecoration(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Color', style: AppTextStyle.textStyle18Bold),
            Row(
              children: [
                BlocBuilder<ProductColorsSelectionCubit, int>(
                  builder: (context, state) {
                    return Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(
                          product.colors[state].rgb[0],
                          product.colors[state].rgb[1],
                          product.colors[state].rgb[2],
                          1,
                        ),
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  width: AppPadding.horizontalPagePadding,
                ),
                SvgPicture.asset(
                  AppVectors.arrowDownBlack,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
