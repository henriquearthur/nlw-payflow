import 'package:flutter/material.dart';
import 'package:payflow/modules/login/login_page.dart';
import 'package:payflow/shared/themes/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PayFlow',
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      home: Scaffold(
        backgroundColor: AppColors.background,
        body: LoginPage(),
      ),
    );
  }
}
