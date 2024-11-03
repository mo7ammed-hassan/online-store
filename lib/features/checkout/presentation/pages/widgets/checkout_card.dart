import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_store/core/configs/assets/app_vectors.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';

class CheckoutCard extends StatelessWidget {
  final String hintText;
  final VoidCallback onTap;
  final TextEditingController? textFieldController;
  const CheckoutCard({super.key, required this.hintText, required this.onTap, this.textFieldController});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: const BoxDecoration(
          color: AppColors.fillColorLightMode,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    hintText,
                    style:
                        AppTextStyle.textStyle16.copyWith(color: Colors.grey),
                  ),
                  TextField(
                    controller: textFieldController,
                    scribbleEnabled: false,
                    style: AppTextStyle.textStyle18W500
                        .copyWith(overflow: TextOverflow.ellipsis),
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: AppTextStyle.textStyle18W500,
                      contentPadding: const EdgeInsets.all(0),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Transform.rotate(
                angle: -180 * (3.14 / 180),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 25,
                    maxHeight: 25,
                  ),
                  child: SvgPicture.asset(
                    AppVectors.arrowBack,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
