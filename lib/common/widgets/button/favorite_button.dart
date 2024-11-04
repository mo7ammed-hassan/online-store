import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';
import 'package:online_store/features/product_detail.dart/cubits/favorite_icon_cuit.dart';

class FavoriteButton extends StatelessWidget {
  final ProductEntity product;
  const FavoriteButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<FavoriteIconCuit>().onTap(product);
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: AppColors.fillColorLightMode,
          shape: BoxShape.circle,
        ),
        child: BlocBuilder<FavoriteIconCuit, bool>(
          builder: (context, state) {
            return Icon(
              state ? Icons.favorite : Icons.favorite_outline_outlined,
              color: state ? Colors.red : null,
              size: 22,
            );
          },
        ),
      ),
    );
  }
}
