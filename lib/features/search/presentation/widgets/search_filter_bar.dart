import 'package:flutter/material.dart';
import 'package:online_store/features/search/presentation/widgets/filter_selector.dart';

class SearchFilterBar extends StatelessWidget {
  const SearchFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FilterSelector(
            title: 'On Sale',
          ),
          FilterSelector(
            title: 'Price',
          ),
          FilterSelector(
            title: 'Sort by',
          ),
          FilterSelector(
            title: 'Gender',
          ),
        ],
      ),
    );
  }
}
