import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/widgets/basic_decoration/basic_container_decoration.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';
import 'package:online_store/features/product_detail.dart/cubits/product_quantity_cubit.dart';

class ProductQuantity extends StatelessWidget {
  final ProductEntity product;
  const ProductQuantity({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BasicContainerDecoration(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Quantity',
            style: AppTextStyle.textStyle18Bold,
          ),
          Row(
            children: [
              _quantityButtom(
                onPressed: () {
                  context.read<ProductQuantityCubit>().removeFromBag();
                },
                icon: Icons.remove,
              ),
              const SizedBox(
                width: 10,
              ),
              BlocBuilder<ProductQuantityCubit, int>(
                builder: (context, state) {
                  return Text(
                    state.toString(),
                    style: AppTextStyle.textStyle18Bold,
                  );
                },
              ),
              const SizedBox(
                width: 10,
              ),
              _quantityButtom(
                onPressed: () {
                  context.read<ProductQuantityCubit>().addToBag();
                },
                icon: Icons.add,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _quantityButtom(
      {required IconData icon, required Function()? onPressed}) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryColor,
        ),
        child: Center(
          child: Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
