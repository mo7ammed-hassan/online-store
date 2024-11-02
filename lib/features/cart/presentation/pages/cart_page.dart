import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/cart/presentation/pages/cubits/cart_product_display_cubit.dart';
import 'package:online_store/features/cart/presentation/pages/widgets/cart_page_body.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartProductDisplayCubit()..displayCartProducts(),
      child: const Scaffold(
        appBar: BasicAppBar(
          hideBack: false,
          title: Text(
            'Cart',
            style: AppTextStyle.textStyle24Bold,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.horizontalPagePadding,
            vertical: 8,
          ),
          child: CartPageBody(),
        ),
      ),
    );
  }
}
