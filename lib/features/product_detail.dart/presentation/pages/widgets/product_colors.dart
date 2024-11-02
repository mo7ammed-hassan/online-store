import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';
import 'package:online_store/features/product_detail.dart/cubits/product_color_selection_cubit.dart';

class ProductColors extends StatelessWidget {
  final ProductEntity product;
  const ProductColors({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 2.2,
      padding: const EdgeInsets.all(AppPadding.horizontalPagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.04,
            child: Stack(
              children: [
                const Center(
                  child: Text(
                    'Color',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: AppPadding.horizontalPagePadding),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: product.colors.length,
              itemBuilder: (context, index) {
                return BlocBuilder<ProductColorsSelectionCubit, int>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        context
                            .read<ProductColorsSelectionCubit>()
                            .selectColor(index);
                        context.pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: state == index
                              ? AppColors.primaryColor
                              : AppColors.fillColorLightMode,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.colors[index].title,
                              style: AppTextStyle.textStyle18Bold.copyWith(
                                color: state == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(
                                      product.colors[index].rgb[0],
                                      product.colors[index].rgb[1],
                                      product.colors[index].rgb[2],
                                      1,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(
                                  width: AppPadding.horizontalPagePadding,
                                ),
                                state == index
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 30,
                                      )
                                    : const SizedBox(
                                        width: 20,
                                      ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: AppPadding.horizontalPagePadding),
            ),
          ),
        ],
      ),
    );
  }
}