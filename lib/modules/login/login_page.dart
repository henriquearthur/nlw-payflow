import 'package:flutter/material.dart';
import 'package:payflow/modules/login/components/social_login/google_login_button.dart';
import 'package:payflow/modules/login/login_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';

import 'components/login_header.dart';
import 'components/login_title.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final LoginController loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const LoginHeader(),
          const LoginTitle(),
          GoogleLoginButton(
            onTap: loginController.googleSignIn,
          ),
        ],
      ),
    );
  }
}
