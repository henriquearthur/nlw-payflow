import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class DividerVerticalComponent extends StatelessWidget {
  const DividerVerticalComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.0,
      height: double.maxFinite,
      color: AppColors.stroke,
      child: null,
    );
  }
}
