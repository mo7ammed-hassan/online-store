import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/features/auth/presentation/cubits/gender_selection_cubit.dart';

class GenderTitle extends StatelessWidget {
  final String gender;
  final int genderIndex;
  const GenderTitle({
    super.key,
    required this.gender,
    required this.genderIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          context.read<GenderSelectionCubit>().selectGender(genderIndex);
        },
        child: BlocBuilder<GenderSelectionCubit, int>(
          builder: (context, selectedIndex) {
            return Container(
              height: 60,
              decoration: BoxDecoration(
                color: selectedIndex == genderIndex
                    ? AppColors.primaryColor
                    : AppColors.fillColorLightMode,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  gender,
                  style: AppTextStyle.textStyle17.copyWith(
                    color: selectedIndex == genderIndex
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
