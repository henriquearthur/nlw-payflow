import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: 380.0,
      child: Stack(
        children: [
          Container(
            width: screenSize.width,
            height: screenSize.height * 0.36,
            color: AppColors.primary,
          ),
          Positioned(
            top: 50.0,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                AppImages.person,
                height: 373,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: screenSize.width,
              height: 150.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment(0.0, 1.0),
                  colors: [
                    AppColors.background.withOpacity(0),
                    AppColors.background
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
