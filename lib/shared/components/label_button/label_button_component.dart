import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class LabelButtonComponent extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle? style;

  const LabelButtonComponent(
      {Key? key, required this.label, required this.onPressed, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      child: Text(
        label,
        style: style ?? AppTextStyles.buttonHeading,
      ),
    );
  }
}
