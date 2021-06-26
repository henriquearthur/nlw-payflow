import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Image.asset(
            AppImages.logoLogin,
            height: 44,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 24.0),
          child: AnimatedTextKit(
            isRepeatingAnimation: false,
            animatedTexts: [
              TyperAnimatedText(
                'Organize seus boletos em um só lugar',
                textStyle: AppTextStyles.titleHome,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
