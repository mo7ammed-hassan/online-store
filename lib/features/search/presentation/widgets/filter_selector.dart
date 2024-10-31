import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_store/common/helper/bottom_sheet/app_bottom_sheet.dart';
import 'package:online_store/core/configs/assets/app_vectors.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/features/search/presentation/widgets/filter_bottom_sheet.dart';

class FilterSelector extends StatefulWidget {
  final String title;
  const FilterSelector({super.key, required this.title});

  @override
  State<FilterSelector> createState() => _BasicState();
}

class _BasicState extends State<FilterSelector> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () {
          AppBottomSheet.display(
            context,
            FilterBottomSheet(
              title: widget.title,
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.fillColorLightMode,
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              SvgPicture.asset(
                isSelected ? AppVectors.arrowDown : AppVectors.arrowDownBlack,
                fit: BoxFit.scaleDown,
              )
            ],
          ),
        ),
      ),
    );
  }
}
