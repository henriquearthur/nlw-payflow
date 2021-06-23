import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:payflow/app_widget.dart';

import 'modules/splash/splash_page.dart';
import 'shared/auth/auth_controller.dart';
import 'shared/services/navigator_service.dart';

void main() {
  GetIt.I.registerLazySingleton<NavigatorService>(() => NavigatorService());
  GetIt.I.registerLazySingleton<AuthController>(() => AuthController());

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _firebaseInit = Firebase.initializeApp();

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firebaseInit,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Material(
            child: Center(
              child: Text(
                "Não foi possível inicializar o Firebase.",
                textDirection: TextDirection.ltr,
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return AppWidget();
        } else {
          return MaterialApp(
            home: const SplashPage(),
          );
        }
      },
    );
  }
}
