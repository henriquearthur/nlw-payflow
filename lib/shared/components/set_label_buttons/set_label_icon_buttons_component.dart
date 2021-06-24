import 'package:flutter/material.dart';
import 'package:payflow/shared/label_button.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class SetLabelIconButtonsComponent extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final Icon icon;
  final VoidCallback iconOnPressed;

  const SetLabelIconButtonsComponent({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.icon,
    required this.iconOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.shape,
      height: 56,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: LabelButton(
              label: primaryLabel,
              onPressed: primaryOnPressed,
            ),
          ),
          IconButton(
            icon: icon,
            onPressed: iconOnPressed,
          )
        ],
      ),
    );
  }
}
