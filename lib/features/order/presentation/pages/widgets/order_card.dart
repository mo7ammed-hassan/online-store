import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_store/core/configs/assets/app_vectors.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/features/order/domain/entity/order_entity.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: AppColors.fillColorLightMode,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width * 0.08,
                ),
                child: SvgPicture.asset(
                  AppVectors.orderVector,
                  width: MediaQuery.sizeOf(context).width * 0.06,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order  #${order.orderNumber}',
                    style: AppTextStyle.textStyle18,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${order.cartItems.length} items',
                    style: AppTextStyle.textStyle16Bold
                        .copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Transform.rotate(
                angle: 180 * (3.14 / 180),
                child: SvgPicture.asset(AppVectors.arrowBack, width: 8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
