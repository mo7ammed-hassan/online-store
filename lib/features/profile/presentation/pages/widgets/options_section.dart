import 'package:flutter/material.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/features/profile/presentation/pages/widgets/option_card.dart';
import 'package:online_store/features/wishlist/prersentation/pages/wishlist_page.dart';

class OptionsSection extends StatelessWidget {
  const OptionsSection({super.key});

  static const List<String> options = [
    'Address',
    'Wishlist',
    'Payment',
    'Help',
    'Support'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options
          .map(
            (option) => OptionCard(
              title: option,
              onTap: () => _navigateToPage(option, context),
            ),
          )
          .toList(),
    );
  }

  void _navigateToPage(String option, BuildContext context) {
    switch (option) {
      case 'Address':
      case 'Payment':
      case 'Help':
      case 'Support':
        context.push(const SizedBox());
        break;
      case 'Wishlist':
        context.push(const WishlistPage());
        break;
    }
  }
}
