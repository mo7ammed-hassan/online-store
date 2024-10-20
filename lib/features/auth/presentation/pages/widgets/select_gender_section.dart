import 'package:flutter/material.dart';
import 'package:online_store/features/auth/presentation/pages/widgets/gender_title.dart';

class SelectGenderSection extends StatelessWidget {
  const SelectGenderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        GenderTitle(genderIndex: 1, gender: 'Men'),
        SizedBox(width: 18),
        GenderTitle(genderIndex: 2, gender: 'Women'),
      ],
    );
  }
}
