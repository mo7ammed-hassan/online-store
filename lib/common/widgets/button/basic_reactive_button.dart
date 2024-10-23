import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/cubits/button/button_state_cubit.dart';
import 'package:online_store/common/cubits/button/button_state.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';

class BasicReactiveButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? height;
  const BasicReactiveButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonStateCubit, ButtonState>(
      builder: (context, state) {
        if (state is ButtonLoadingState) {
          return _loadingButton();
        }

        return _initialButton();
      },
    );
  }

  ElevatedButton _initialButton() {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(
          height ?? 50,
        ),
      ),
      child: FittedBox(
        child: Text(
          title,
          style: AppTextStyle.textStyle18Medium,
        ),
      ),
    );
  }

  ElevatedButton _loadingButton() {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(
          height ?? 50,
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
