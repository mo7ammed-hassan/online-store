import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/helper/bottom_sheet/app_bottom_sheet.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/auth/presentation/cubits/age_selection_cubit.dart';
import 'package:online_store/features/auth/presentation/cubits/get_ages_cubit.dart';
import 'package:online_store/features/auth/presentation/pages/widgets/age_range.dart';

class SelectAgeSection extends StatelessWidget {
  const SelectAgeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgeSelectionCubit, String>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            AppBottomSheet.display(
              context,
              MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: context.read<AgeSelectionCubit>(),
                  ),
                  BlocProvider.value(
                    value: context.read<GetAgesCubit>()..getAges(),
                  ),
                ],
                child: const AgeRange(),
              ),
            );
          },
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.horizontalPagePadding,
            ),
            decoration: BoxDecoration(
              color: AppColors.fillColorLightMode,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  state,
                  style: AppTextStyle.textStyle16,
                ),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        );
      },
    );
  }
}
