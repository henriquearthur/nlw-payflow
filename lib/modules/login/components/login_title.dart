import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Image.asset(AppImages.logomini),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 24.0),
          child: Text(
            "Organize seus boletos em um só lugar",
            style: AppTextStyles.titleHome,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
