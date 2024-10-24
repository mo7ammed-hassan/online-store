import 'package:flutter/material.dart';
import 'package:online_store/core/utils/constants/app_padding.dart';
import 'package:online_store/features/home/presentation/widgets/home_page_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppPadding.verticalPagePadding,
            horizontal: AppPadding.horizontalPagePadding,
          ),
          child: Column(
            children: [
              HomePageHeader(),
            ],
          ),
        ),
      ),
    );
  }
}
