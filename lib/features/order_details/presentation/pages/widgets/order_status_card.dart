import 'package:flutter/material.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/features/order/domain/entity/order_status_entity.dart';

class OrderStatusCard extends StatelessWidget {
  final OrderStatusEntity status;
  const OrderStatusCard({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height * 0.04),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: status.done
                      ? AppColors.primaryColor
                      : AppColors.fillColorLightMode,
                ),
                child: status.done
                    ? const Icon(
                        Icons.done,
                        color: AppColors.fillColorLightMode,
                      )
                    : const Icon(
                        Icons.done,
                        color: Colors.transparent,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  status.title,
                  style: AppTextStyle.textStyle16Bold,
                ),
              ),
            ],
          ),
          Text(
            status.createdDate.toDate().toString().split(' ')[0],
            style: AppTextStyle.textStyle16Medium,
          ),
        ],
      ),
    );
  }
}
