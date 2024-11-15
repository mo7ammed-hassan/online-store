import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/configs/assets/app_images.dart';
import 'package:online_store/features/auth/domain/entities/current_user_entity.dart';
import 'package:online_store/features/profile/presentation/cubit/get_user_cuit.dart';
import 'package:online_store/features/profile/presentation/cubit/get_user_state.dart';
import 'package:online_store/features/profile/presentation/pages/widgets/user_info_card.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserCuit, GetUserState>(
      builder: (context, state) {
        if (state is GetUserLoading) {
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        }

        if (state is GetUserLoaded) {
          return Column(
            children: [
              _profileImage(),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
              UserInfoCard(
                user: state.user,
              ),
            ],
          );
        }
        return Column(
          children: [
            _profileImage(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
            UserInfoCard(
              user: CurrentUserEntity(
                userId: '',
                firstName: '',
                lastName: '',
                email: '',
                image: '',
                gender: 1,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _profileImage() {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(AppImages.userImage),
        ),
      ),
    );
  }
}
