import 'package:flutter/material.dart';
import 'package:online_store/features/order/domain/entity/order_status_entity.dart';
import 'package:online_store/features/order_details/presentation/pages/widgets/order_status_card.dart';

class OrderStatusSection extends StatelessWidget {
  final List<OrderStatusEntity> orderStatus;
  const OrderStatusSection({super.key, required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: orderStatus.asMap().entries.map((entry) {
        OrderStatusEntity status = entry.value;
        return OrderStatusCard(
          status: status,
        );
      }).toList(),
    );
  }
}
