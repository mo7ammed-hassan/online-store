import 'package:flutter/material.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/order/domain/entity/order_entity.dart';
import 'package:online_store/features/order_details/presentation/pages/widgets/order_status_section.dart';
import 'package:online_store/features/order_details/presentation/pages/widgets/order_item_card.dart';
import 'package:online_store/features/order_details/presentation/pages/widgets/shipping_card_details.dart';

class OrderDetailsPage extends StatelessWidget {
  final OrderEntity order;

  const OrderDetailsPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.horizontalPagePadding,
          vertical: AppPadding.verticalPagePadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderStatusSection(orderStatus: order.orderStatus),
            const SizedBox(height: AppPadding.defaultSpaceWidget),
            _buildSectionHeader('Order Items'),
            const SizedBox(height: AppPadding.defaultSpaceWidget / 2),
            OrderItemCard(order: order),
            const SizedBox(height: AppPadding.defaultSpaceWidget),
            _buildSectionHeader('Shipping Details'),
            const SizedBox(height: AppPadding.defaultSpaceWidget / 2),
            const ShippingDetailsCard(),
            // shipping details widget.
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return BasicAppBar(
      hideBack: false,
      arrowBackOnTap: () => context.pop(),
      title: Text(
        'Order #${order.orderNumber}',
        style: AppTextStyle.textStyle22Bold,
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: AppTextStyle.textStyle18Bold,
    );
  }
}
