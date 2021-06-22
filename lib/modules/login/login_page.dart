import 'package:flutter/material.dart';
import 'package:payflow/modules/login/components/social_login/google_login_button.dart';

import 'components/login_header.dart';
import 'components/login_title.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LoginHeader(),
        const LoginTitle(),
        GoogleLoginButton(
          onTap: () => print('clicked'),
        ),
      ],
    );
  }
}
