import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/order/presentation/cubits/get_orders_cubit.dart';
import 'package:online_store/features/order/presentation/cubits/get_orders_state.dart';
import 'package:online_store/features/order/presentation/pages/widgets/orders_list.dart';

class OrderPageBody extends StatelessWidget {
  const OrderPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.horizontalPagePadding,
        vertical: AppPadding.verticalPagePadding,
      ),
      child: BlocBuilder<GetOrdersCubit, GetOrdersState>(
        builder: (context, state) {
          if (state is GetOrdersLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GetOrdersLoaded) {
            if (state.orders.isEmpty) {
              return const SizedBox(height: 200.0);
            }
            return OrdersList(
              orders: state.orders,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
