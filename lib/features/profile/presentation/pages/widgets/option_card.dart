import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_store/common/widgets/basic_decoration/basic_container_decoration.dart';
import 'package:online_store/core/configs/assets/app_vectors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';

class OptionCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const OptionCard({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppPadding.defaultSpaceWidget / 2),
      child: GestureDetector(
        onTap: onTap,
        child: BasicContainerDecoration(
          borderRadius: 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyle.textStyle16Bold,
              ),
              _arrowIcon(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _arrowIcon() {
    return Transform.rotate(
      angle: 180 * (3.14 / 180),
      child: SvgPicture.asset(
        AppVectors.arrowBack,
        fit: BoxFit.contain,
        width: 10,
      ),
    );
  }
}
