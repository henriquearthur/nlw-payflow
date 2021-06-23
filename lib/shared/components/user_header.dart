import 'package:flutter/material.dart';
import 'package:payflow/shared/models/user.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class UserHeader extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final User user;

  UserHeader({
    Key? key,
    this.height = 152.0,
    required this.user,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, 1.0),
          colors: AppColors.gradient,
          radius: 1.0,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: ListTile(
            title: Text.rich(
              TextSpan(
                text: "Olá, ",
                style: AppTextStyles.titleRegular,
                children: [
                  TextSpan(
                      text: user.name,
                      style: AppTextStyles.titleBoldBackground),
                ],
              ),
            ),
            subtitle: Text(
              "Mantenha suas contas em dia!",
              style: AppTextStyles.captionShape,
            ),
            trailing: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
