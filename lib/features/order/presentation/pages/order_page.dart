import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/features/order/presentation/cubits/get_orders_cubit.dart';
import 'package:online_store/features/order/presentation/pages/widgets/order_page_body.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) =>  GetOrdersCubit()..getAllOrders(),
      child: const Scaffold(
        appBar: BasicAppBar(
          hideBack: false,
          title: Text(
            'Orders',
            style: AppTextStyle.textStyle22Bold,
          ),
        ),
        body: OrderPageBody(),
      ),
    );
  }
}
