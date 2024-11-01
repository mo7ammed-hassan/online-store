import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_store/core/configs/assets/app_vectors.dart';

generateBtnBarIcon(String vector, int index, int state) {
  return SvgPicture.asset(
    state == index
        ? AppVectors.generateActVector('act_$vector') // Active icon
        : AppVectors.generateInActVector(vector),
    fit: BoxFit.scaleDown,
  );
}
