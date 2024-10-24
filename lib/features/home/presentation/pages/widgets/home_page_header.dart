import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_store/core/configs/assets/app_images.dart';
import 'package:online_store/core/configs/assets/app_vectors.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/features/auth/domain/entities/current_user_entity.dart';
import 'package:online_store/features/home/presentation/cubits/user_info_display_cubit.dart';
import 'package:online_store/features/home/presentation/cubits/user_info_display_state.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
        builder: (context, state) {
          if (state is UserInfoLoading) {
            return _loadingUserInfoWidget();
          }
          if (state is UserInfoLoaded) {
            return _loadedUserInfoWidget(state);
          }
          return Container();
        },
      ),
    );
  }

  Row _loadedUserInfoWidget(UserInfoLoaded state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _profileImage(),
        _gender(state.userEntity),
        _bag(),
      ],
    );
  }

  Row _loadingUserInfoWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _profileImage(),
        _gender(null),
        _bag(),
      ],
    );
  }

  Widget _profileImage() {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: AppColors.fillColorLightMode,
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        AppImages.userVector,
      ),
    );
  }

  Widget _gender(CurrentUserEntity? user) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.fillColorLightMode,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          FittedBox(
            child: Text(
              user != null
                  ? user.gender == 1
                      ? 'Men'
                      : 'Women'
                  : '...',
              style: AppTextStyle.textStyle16Bold,
            ),
          ),
          const SizedBox(width: 12),
          SvgPicture.asset(
            AppVectors.arrowDown,
          ),
        ],
      ),
    );
  }

  Widget _bag() {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        AppVectors.bagVector,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
