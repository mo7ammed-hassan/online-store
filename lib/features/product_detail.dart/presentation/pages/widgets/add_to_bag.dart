import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/helper/product/product_price.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';
import 'package:online_store/features/product_detail.dart/cubits/product_quantity_cubit.dart';

class AddToBag extends StatelessWidget {
  final ProductEntity product;
  const AddToBag({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.horizontalPagePadding),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(
            60,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<ProductQuantityCubit, int>(
              builder: (context, state) {
                double price =
                    ProductPriceHelper.provideCurrentPrice(product: product) *
                        state;
                return Text(
                  "\$$price",
                  style: AppTextStyle.textStyle16Bold,
                );
              },
            ),
            const Text(
              'Add to Bag',
              style: AppTextStyle.textStyle16Bold,
            ),
          ],
        ),
      ),
    );
  }
}
