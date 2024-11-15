import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/cubits/button/button_state.dart';
import 'package:online_store/common/cubits/button/button_state_cubit.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/common/helper/cart/cart_helper.dart';
import 'package:online_store/common/helper/order/order_helper.dart';
import 'package:online_store/common/widgets/button/basic_reactive_button.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/cart/domain/entity/cart_item_entity.dart';
import 'package:online_store/features/cart/presentation/pages/widgets/cart_order_details.dart';
import 'package:online_store/features/checkout/data/models/order_registration_req_model.dart';
import 'package:online_store/features/checkout/domain/use_cases/order_regestration_use_case.dart';
import 'package:online_store/features/checkout/presentation/pages/widgets/checkout_card.dart';
import 'package:online_store/features/checkout/presentation/pages/widgets/successfully_checkout_widget.dart';
import 'package:online_store/features/order/domain/entity/order_status_entity.dart';

class CheckoutPageBody extends StatelessWidget {
  final List<CartItemEntity> cartItems;
  const CheckoutPageBody({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    TextEditingController adderssController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.horizontalPagePadding,
      ),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
          _addressField(adderssController),
          const SizedBox(height: AppPadding.horizontalPagePadding),
          _paymentMethodField(),
          const Spacer(flex: 4),
          CartOrderDetails(
            cartItems: cartItems,
          ),
          const Spacer(flex: 1),
          BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonSuccessState) {
                context.push(const SuccessfullyCheckoutWidget());
              }
            },
            child: BasicReactiveButton(
              height: MediaQuery.sizeOf(context).height * 0.06,
              onPressed: () {
                context.read<ButtonStateCubit>().execute(
                      useCase: OrderRegestrationUseCase(),
                      params: OrderRegistrationReqModel(
                        cartItems: cartItems,
                        createdDate: DateTime.now().toString(),
                        itemCount: cartItems.length,
                        shippingAddress: adderssController.text,
                        totalPrice: CartHelper.calculateCartSubTotal(cartItems),
                        orderNumber:
                            OrderHelper.generateOrderNumber().toString(),
                        orderStatus: [
                          OrderStatusEntity(
                            title: 'Delivered',
                            done: false,
                            createdDate: Timestamp.now(),
                          ),
                          OrderStatusEntity(
                            title: 'Shipping',
                            done: false,
                            createdDate: Timestamp.now(),
                          ),
                          OrderStatusEntity(
                            title: 'Order Confirmed',
                            done: false,
                            createdDate: Timestamp.now(),
                          ),
                          OrderStatusEntity(
                            title: 'Order Placed',
                            done: false,
                            createdDate: Timestamp.now(),
                          ),
                        ],
                      ),
                    );
              },
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${CartHelper.calculateCartSubTotal(cartItems)}",
                    style: AppTextStyle.textStyle16Bold,
                  ),
                  const Text(
                    'Place Order',
                    style: AppTextStyle.textStyle16Bold,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
        ],
      ),
    );
  }

  Widget _addressField(TextEditingController controller) {
    return CheckoutCard(
      textFieldController: controller,
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
