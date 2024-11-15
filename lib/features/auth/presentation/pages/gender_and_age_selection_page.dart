import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/cubits/button/button_state.dart';
import 'package:online_store/common/cubits/button/button_state_cubit.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:online_store/common/widgets/button/basic_reactive_button.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/auth/data/models/user_creation_req_model.dart';
import 'package:online_store/features/auth/domain/use_case/signup_use_case.dart';
import 'package:online_store/features/auth/presentation/cubits/age_selection_cubit.dart';
import 'package:online_store/features/auth/presentation/cubits/gender_selection_cubit.dart';
import 'package:online_store/features/auth/presentation/cubits/get_ages_cubit.dart';
import 'package:online_store/features/auth/presentation/pages/widgets/select_gender_section.dart';
import 'package:online_store/features/main/presentation/page/main_page.dart';

import 'widgets/select_age_section.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  final UserCreationReqModel userCreationReq;
  const GenderAndAgeSelectionPage({super.key, required this.userCreationReq});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        arrowBackOnTap: () {
          context.pop();
        },
      ),
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
          BlocProvider(
            create: (context) => ButtonStateCubit(),
          ),
        ],
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonSuccessState) {
              context.pushAndremove(const MainPage());
            }

            if (state is ButtonFailureState) {
              var snackBar = SnackBar(
                content: Text(state.message),
                behavior: SnackBarBehavior.floating,
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
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
      child: Builder(builder: (context) {
        return BasicReactiveButton(
          title: 'Finish',
          onPressed: () {
            userCreationReq.gender =
                context.read<GenderSelectionCubit>().selectedIndex;
            userCreationReq.age = context.read<AgeSelectionCubit>().selectedAge;

            context.read<ButtonStateCubit>().execute(
                  params: userCreationReq,
                  useCase: SignupUseCase(),
                );
          },
        );
      }),
    );
  }
}
