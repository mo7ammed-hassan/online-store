import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_store/common/widgets/basic_decoration/basic_container_decoration.dart';
import 'package:online_store/core/configs/assets/app_vectors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';

class SelectedColor extends StatelessWidget {
  final ProductEntity product;
  const SelectedColor({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BasicContainerDecoration(
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Color', style: AppTextStyle.textStyle18Medium),
          Row(
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(
                    product.colors[0].rgb[0],
                    product.colors[0].rgb[1],
                    product.colors[0].rgb[2],
                    1,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(
                width: AppPadding.horizontalPagePadding,
              ),
              SvgPicture.asset(
                AppVectors.arrowDownBlack,
                fit: BoxFit.scaleDown,
              ),
            ],
          )
        ],
      ),
    );
  }
}
