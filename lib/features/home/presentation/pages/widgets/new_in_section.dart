import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/cubits/product/products_display_cubit.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/home/domain/use_case.dart/product/get_new_in_use_case.dart';
import 'package:online_store/features/home/presentation/pages/widgets/new_in_product.dart';
import 'package:online_store/features/home/presentation/pages/widgets/see_all_widget.dart';

class NewInSection extends StatelessWidget {
  const NewInSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsDisplayCubit(useCase: GetNewInUseCase())..displayProducts(),
      child: Column(
        children: [
          _newIn(),
          const SizedBox(height: AppPadding.defaultSpaceWidget),
          const NewInProduct(),
        ],
      ),
    );
  }

  Widget _newIn() {
    return SeeAllWidget(
      title: 'New In',
      onTap: () {},
    );
  }
}
