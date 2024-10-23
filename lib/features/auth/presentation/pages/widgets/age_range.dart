import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/core/configs/theme/app_text_style.dart';
import 'package:online_store/features/auth/presentation/cubits/age_selection_cubit.dart';
import 'package:online_store/features/auth/presentation/cubits/get_ages_cubit.dart';
import 'package:online_store/features/auth/presentation/cubits/get_ages_state.dart';

class AgeRange extends StatelessWidget {
  const AgeRange({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 2.4,
      child: BlocBuilder<GetAgesCubit, GetAgesState>(
        builder: (context, state) {
          if (state is GetAgesLoading) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }
          if (state is GetAgesLoaded) {
            return _ages(state.ages);
          }
          if (state is GetAgesFailure) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                state.error,
              ),
            );
          }

          return Container();
        },
      ),
    );
  }

  ListView _ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return ListView.separated(
      padding: const EdgeInsets.all(14),
      itemBuilder: (context, index) {
        return _ageCard(ages[index], context);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 12);
      },
      itemCount: ages.length,
    );
  }

  GestureDetector _ageCard(dynamic ages, BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
        context.read<AgeSelectionCubit>().selectAgeRange(
              ages.data()['value'],
            );
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: const Color.fromARGB(255, 228, 223, 223),
        ),
        child: Text(
          ages.data()['value'],
          style: AppTextStyle.textStyle15.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
