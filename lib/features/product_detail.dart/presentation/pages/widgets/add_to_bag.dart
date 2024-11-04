import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/cubits/button/button_state.dart';
import 'package:online_store/common/cubits/button/button_state_cubit.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/common/helper/product/product_price.dart';
import 'package:online_store/common/widgets/button/basic_reactive_button.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/cart/presentation/pages/cart_page.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';
import 'package:online_store/features/cart/data/models/add_to_cart_req_model.dart';
import 'package:online_store/features/cart/domain/use_cases/add_to_cart_use_case.dart';
import 'package:online_store/features/product_detail.dart/cubits/product_color_selection_cubit.dart';
import 'package:online_store/features/product_detail.dart/cubits/product_quantity_cubit.dart';
import 'package:online_store/features/product_detail.dart/cubits/product_size_selection_cubit.dart';

class AddToBag extends StatelessWidget {
  final ProductEntity product;
  const AddToBag({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ButtonStateCubit, ButtonState>(
      listener: (context, state) {
        if (state is ButtonSuccessState) {
          context.push(const CartPage());
        }
        if (state is ButtonFailureState) {
          var snackbar = SnackBar(
            content: Text(state.message),
            behavior: SnackBarBehavior.floating,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.horizontalPagePadding),
        child: BasicReactiveButton(
          height: MediaQuery.sizeOf(context).height * 0.06,
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
                  params: AddToCartReqModel(
                    productId: product.productId,
                    productTitle: product.title,
                    productQuantity: context.read<ProductQuantityCubit>().state,
                    productColor: product
                        .colors[context
                            .read<ProductColorsSelectionCubit>()
                            .selectedIndex]
                        .title,
                    productSize: product.size[
                        context.read<ProductSizeSelectionCubit>().selectedSize],
                    productPrice: product.price.toDouble(),
                    totalPrice: ProductPriceHelper.provideCurrentPrice(
                            product: product) *
                        context.read<ProductQuantityCubit>().state,
                    productImageUrl: product.images[0],
                    createdDate: DateTime.now().toString(),
                  ),
                  useCase: AddToCartUseCase(),
                );
          },
          content: Row(
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
      ),
    );
  }
}
