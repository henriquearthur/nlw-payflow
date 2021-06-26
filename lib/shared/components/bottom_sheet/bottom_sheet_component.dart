import 'package:flutter/material.dart';
import 'package:payflow/shared/components/set_label_buttons/set_label_buttons_component.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class BottomSheetComponent extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final String title;
  final String subtitle;

  const BottomSheetComponent({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.shape,
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black.withOpacity(0.8),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Text.rich(
              TextSpan(
                text: title,
                style: AppTextStyles.buttonBoldHeading,
                children: [
                  TextSpan(
                    text: "\n$subtitle",
                    style: AppTextStyles.buttonHeading,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            color: AppColors.stroke,
            thickness: 1,
            height: 1,
          ),
          SetLabelButtonsComponent(
            primaryLabel: primaryLabel,
            primaryOnPressed: primaryOnPressed,
            secondaryLabel: secondaryLabel,
            secondaryOnPressed: secondaryOnPressed,
            enablePrimaryColor: true,
          ),
        ],
      ),
    );
  }
}
