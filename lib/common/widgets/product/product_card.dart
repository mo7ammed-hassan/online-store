import 'package:flutter/material.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: AspectRatio(
        aspectRatio: 159 / 283,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.fillColorLightMode,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/produvt.png'),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Men\'s Harrington Jacket',
                        maxLines: 1,
                        style: AppTextStyle.textStyle14,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          FittedBox(
                            child: Text(
                              '\$148.88',
                              style: AppTextStyle.textStyle14
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(width: 14),
                          FittedBox(
                            child: Text(
                              '\$200.88',
                              style: AppTextStyle.textStyle14.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.hintTextColorLightMode,
                                decoration: TextDecoration.lineThrough,
                                decorationColor:
                                    AppColors.hintTextColorLightMode,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
