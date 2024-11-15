import 'package:flutter/material.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/features/order/domain/entity/order_entity.dart';

class ShippingDetailsCard extends StatelessWidget {
  final OrderEntity order;
  const ShippingDetailsCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: AppColors.fillColorLightMode,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            order.shippingAddress,
            style: AppTextStyle.textStyle16,
          ),
          const SizedBox(height: 10),
          Text(
            order.createdDate.split(' ')[0],
            style: AppTextStyle.textStyle16,
          ),
        ],
      ),
    );
  }
}
