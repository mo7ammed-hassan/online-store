import 'package:flutter/material.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/order/domain/entity/order_entity.dart';
import 'package:online_store/features/order/presentation/pages/widgets/filter_order_card.dart';
import 'package:online_store/features/order/presentation/pages/widgets/order_card.dart';

class OrdersList extends StatelessWidget {
  final List<OrderEntity> orders;
  const OrdersList({
    super.key,
    required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(
            children: List.generate(
              4,
              (index) {
                return const FilterOrderCard();
              },
            ),
          ),
        ),
        const SizedBox(height: AppPadding.verticalPagePadding),
        Expanded(
          child: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return OrderCard(order: orders[index]);
            },
          ),
        ),
      ],
    );
  }
}
