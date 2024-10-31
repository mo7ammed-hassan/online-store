import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_store/common/cubits/product/products_display_cubit.dart';
import 'package:online_store/core/configs/assets/app_vectors.dart';

class SearchField extends StatelessWidget {
  final bool hideSuffixIcon;
  const SearchField({super.key, this.hideSuffixIcon = true});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return TextField(
      controller: controller,
      onChanged: (value) {
        if (value.isEmpty) {
          context.read<ProductsDisplayCubit>().displayInitial();
        } else {
          context.read<ProductsDisplayCubit>().displayProducts(params: value);
        }
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
        suffixIcon: hideSuffixIcon
            ? null
            : IconButton(
                onPressed: () {
                  controller.clear();
                  context.read<ProductsDisplayCubit>().displayInitial();
                },
                icon: const Icon(Icons.close),
              ),
      ),
    );
  }
}
