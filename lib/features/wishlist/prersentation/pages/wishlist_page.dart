import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:online_store/core/configs/assets/app_vectors.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/favorite/presentation/pages/favorite_page.dart';
import 'package:online_store/features/main/presentation/page/main_page.dart';
// import 'package:online_store/features/profile/presentation/pages/profile_page.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        arrowBacOnTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MainPage(),
            ),
          );
        },
        title: const Text(
          'Wishlist',
          style: AppTextStyle.textStyle22Bold,
        ),
        hideBack: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.verticalPagePadding,
            horizontal: AppPadding.horizontalPagePadding,
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  context.push(const FavoritePage());
                },
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: AppColors.fillColorLightMode,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Flexible(
                        fit: FlexFit.loose,
                        child: Icon(
                          Icons.favorite_border_outlined,
                          size: 35,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'My Favorite',
                              style: AppTextStyle.textStyle18,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '12 Products',
                              style: AppTextStyle.textStyle14
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      _arrowIcon(),
                    ],
                  ),
                ),
              )
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
