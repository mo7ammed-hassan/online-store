import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/core/configs/assets/app_vectors.dart';
import 'package:online_store/features/search/presentation/pages/search_page.dart';

class HomeSearchField extends StatelessWidget {
  final bool hideSuffixIcon;
  const HomeSearchField({super.key, this.hideSuffixIcon = true});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      onTap: () {
        context.push(const SearchPage());
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        prefixIcon: SvgPicture.asset(
          AppVectors.search,
          fit: BoxFit.none,
        ),
        hintText: 'Search',
        suffixIcon: hideSuffixIcon ? null : const Icon(Icons.close),
      ),
    );
  }
}
