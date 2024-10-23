import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/widgets/basic_app_bar.dart';
import 'package:online_store/common/widgets/basic_app_button.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/auth/presentation/cubits/age_selection_cubit.dart';
import 'package:online_store/features/auth/presentation/cubits/gender_selection_cubit.dart';
import 'package:online_store/features/auth/presentation/cubits/get_ages_cubit.dart';
import 'package:online_store/features/auth/presentation/pages/widgets/select_gender_section.dart';

import 'widgets/select_age_section.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  const GenderAndAgeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(hideBack: true),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GenderSelectionCubit(),
          ),
          BlocProvider(
            create: (context) => AgeSelectionCubit(),
          ),

          BlocProvider(
            create: (context) => GetAgesCubit(),
          ),
        ],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppPadding.verticalPagePadding,
                horizontal: AppPadding.horizontalPagePadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _tellUsText(),
                  const SizedBox(height: AppPadding.defaultSpaceWidget * 2),
                  _genderText(),
                  const SizedBox(height: 20),
                  const SelectGenderSection(),
                  const SizedBox(height: AppPadding.defaultSpaceWidget * 3),
                  _howOldText(),
                  const SizedBox(height: 20),
                  const SelectAgeSection(),
                ],
              ),
            ),
            const Spacer(),
            _finishButton(context),
          ],
        ),
      ),
    );
  }

  Widget _tellUsText() {
    return const Text(
      'Tell us About yourself',
      style: AppTextStyle.textStyle24,
    );
  }

  Widget _genderText() {
    return const Text(
      'Who do you shop for ?',
      style: AppTextStyle.textStyle18Bold,
    );
  }

  Widget _howOldText() {
    return const Text(
      'How Old are you ?',
      style: AppTextStyle.textStyle18Bold,
    );
  }

  Widget _finishButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.defaultSpaceWidget),
      decoration: const BoxDecoration(
        color: AppColors.fillColorLightMode,
      ),
      child: BasicAppButton(
        title: 'Finish',
        onPressed: () {},
      ),
    );
  }
}
