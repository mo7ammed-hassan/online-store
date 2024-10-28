import 'package:flutter/material.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/home/presentation/pages/widgets/categories_section.dart';
import 'package:online_store/features/home/presentation/pages/widgets/home_page_header.dart';
import 'package:online_store/features/home/presentation/pages/widgets/new_in_section.dart';
import 'package:online_store/features/home/presentation/pages/widgets/search_field.dart';
import 'package:online_store/features/home/presentation/pages/widgets/top_selling_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.horizontalPagePadding,
          ),
          child: Column(
            children: [
              HomePageHeader(),
              SizedBox(height: AppPadding.defaultSpaceWidget),
              SearchField(),
              SizedBox(height: AppPadding.defaultSpaceWidget),
              CategoriesSection(),
              SizedBox(height: AppPadding.defaultSpaceWidget),
              TopSellingSection(),
              SizedBox(height: AppPadding.defaultSpaceWidget),
              NewInSection(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
