import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/cubits/button/button_state_cubit.dart';
import 'package:online_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/features/checkout/presentation/pages/widgets/checkout_page_body.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonStateCubit(),
      child: const Scaffold(
        appBar: BasicAppBar(
          hideBack: false,
          title: Text('Checkout', style: AppTextStyle.textStyle24Bold),
        ),
        body: CheckoutPageBody(),
      ),
    );
  }
}
