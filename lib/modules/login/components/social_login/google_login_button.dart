import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class GoogleLoginButton extends StatelessWidget {
  final VoidCallback onTap;

  const GoogleLoginButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.stroke, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: AppColors.shape,
      ),
      child: Row(
        children: [
          Container(
            width: 24 + 32,
            height: 56,
            child: Center(
                child: Image.asset(AppImages.google, width: 24, height: 24)),
          ),
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: AppColors.stroke, width: 1.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Entrar com Google",
                      style: AppTextStyles.buttonGrey,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
