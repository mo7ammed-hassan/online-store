import 'package:flutter/material.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/search/presentation/widgets/selection_option_list.dart';

class FilterBottomSheet extends StatelessWidget {
  final String title;
  const FilterBottomSheet({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 2.4,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.verticalPagePadding / 2,
          horizontal: AppPadding.horizontalPagePadding,
        ),
        child: Column(
          children: [
            _bottomSheetHeader(context),
            const SelectionOptionList(),
          ],
        ),
      ),
    );
  }

  Widget _bottomSheetHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Clear',
          style: AppTextStyle.textStyle18Medium,
        ),
        Text(
          title,
          style: AppTextStyle.textStyle24,
        ),
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.close,
          ),
        ),
      ],
    );
  }
}
