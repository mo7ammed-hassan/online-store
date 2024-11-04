import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_store/common/helper/bottom_sheet/app_bottom_sheet.dart';
import 'package:online_store/common/widgets/basic_decoration/basic_container_decoration.dart';
import 'package:online_store/core/configs/assets/app_vectors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';
import 'package:online_store/features/product_detail.dart/cubits/product_size_selection_cubit.dart';
import 'package:online_store/features/product_detail.dart/presentation/pages/widgets/product_sizes.dart';

class SelectedSize extends StatelessWidget {
  final ProductEntity product;
  const SelectedSize({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.display(
          context,
          BlocProvider.value(
            value: BlocProvider.of<ProductSizeSelectionCubit>(context),
            child: ProductSizes(product: product),
          ),
        );
      },
      child: BasicContainerDecoration(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Size', style: AppTextStyle.textStyle18Bold),
            Row(
              children: [
                BlocBuilder<ProductSizeSelectionCubit, int>(
                  builder: (context, state) {
                    return Text(
                      product.size[state],
                      style: AppTextStyle.textStyle18Bold,
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
            )
          ],
        ),
      ),
    );
  }
}
