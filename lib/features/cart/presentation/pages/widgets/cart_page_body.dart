import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/features/cart/presentation/pages/cubits/cart_product_display_cubit.dart';
import 'package:online_store/features/cart/presentation/pages/cubits/cart_product_display_state.dart';
import 'package:online_store/features/cart/presentation/pages/widgets/cart_products.dart';
import 'package:online_store/features/cart/presentation/pages/widgets/empty_cart_widget.dart';

class CartPageBody extends StatelessWidget {
  const CartPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartProductDisplayCubit, CartProductDisplayState>(
      builder: (context, state) {
        if (state is CartProductLoading) {
          return Container(
            alignment: Alignment.center,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is CartProductLoaded) {
          return CartProducts(cartProducts: state.cartproducts);
        }

        return const EmptyCartWidget();
      },
    );
  }
}
