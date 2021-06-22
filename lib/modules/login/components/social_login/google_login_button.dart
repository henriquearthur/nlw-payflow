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
      margin: const EdgeInsets.symmetric(horizontal: 40.0),
      height: 56.0,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.stroke, width: 1.0),
        borderRadius: BorderRadius.circular(5.0),
        color: AppColors.shape,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          // TODO: Melhorar esse efeito de InkWell
          onTap: onTap,
          child: Row(
            children: [
              Container(
                height: 56.0,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: AppColors.stroke, width: 1.0),
                  ),
                ),
                child: Image.asset(AppImages.google),
              ),
              Expanded(
                child: Text(
                  "Entrar com Google",
                  style: AppTextStyles.buttonGrey,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
