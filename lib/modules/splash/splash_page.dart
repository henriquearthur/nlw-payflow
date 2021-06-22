import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: Image.asset(AppImages.union)),
        Center(child: Image.asset(AppImages.logoFull)),
      ],
    );
  }
}