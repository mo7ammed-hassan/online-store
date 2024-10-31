import 'package:flutter/material.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/features/search/presentation/widgets/selection_option_card.dart';

class SelectionOptionList extends StatefulWidget {
  const SelectionOptionList({super.key});

  @override
  State<SelectionOptionList> createState() => _SelectionOptionListState();
}

class _SelectionOptionListState extends State<SelectionOptionList> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return SelectionOptionCard(
            isSelected: selectedIndex == index,
            onTap: () {
              context.pop();
              setState(() {
                selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}
