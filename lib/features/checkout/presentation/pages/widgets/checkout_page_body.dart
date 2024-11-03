import 'package:flutter/material.dart';
import 'package:online_store/common/widgets/button/basic_reactive_button.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/cart/presentation/pages/widgets/cart_order_details.dart';
import 'package:online_store/features/checkout/presentation/pages/widgets/checkout_card.dart';

class CheckoutPageBody extends StatelessWidget {
  const CheckoutPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.horizontalPagePadding,
      ),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
          _addressField(),
          const SizedBox(height: AppPadding.horizontalPagePadding),
          _paymentMethodField(),
          const Spacer(flex: 4),
          const CartOrderDetails(
            cartItems: [],
          ),
          const Spacer(flex: 1),
          BasicReactiveButton(
            height: MediaQuery.sizeOf(context).height * 0.06,
            onPressed: () {},
            content: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$200",
                  style: AppTextStyle.textStyle16Bold,
                ),
                Text(
                  'Place Order',
                  style: AppTextStyle.textStyle16Bold,
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
        ],
      ),
    );
  }

  Widget _addressField() {
    return CheckoutCard(
      hintText: 'Shipping Address',
      onTap: () {},
    );
  }

  Widget _paymentMethodField() {
    return CheckoutCard(
      hintText: 'Payment Method',
      onTap: () {},
    );
  }
}
