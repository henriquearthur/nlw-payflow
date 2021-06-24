import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:payflow/shared/auth/auth_controller.dart';

import 'modules/home/home_page.dart';
import 'modules/insert_ticket/insert_ticket_page.dart';
import 'modules/login/login_page.dart';
import 'modules/splash/splash_page.dart';
import 'shared/services/navigator_service.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    GetIt.I.get<AuthController>().loadCurrentUser();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PayFlow',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        primarySwatch: Colors.orange,
      ),
      navigatorKey: GetIt.I.get<NavigatorService>().navigatorKey,
      initialRoute: "/",
      routes: {
        "/": (_) => const SplashPage(),
        "/home": (_) => HomePage(),
        "/login": (_) => LoginPage(),
        "/barcode-scanner": (_) => BarcodeScannerPage(),
        "/insert-ticket": (_) => InsertTicketPage()
      },
    );
  }
}
