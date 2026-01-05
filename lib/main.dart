import 'package:flutter/material.dart';
import 'package:localharvest_canada/config/routes/app_routes.dart';
import 'package:localharvest_canada/features/auth/presentation/pages/login_page.dart';
import 'package:localharvest_canada/features/auth/presentation/pages/register_page.dart';
import 'package:localharvest_canada/features/auth/presentation/pages/splash_page.dart';

void main() {
  runApp(const LocalHarvestApp());
}

class LocalHarvestApp extends StatelessWidget {
  const LocalHarvestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LocalHarvest Canada',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => const SplashPage(),
        AppRoutes.login: (context) =>  LoginPage(),
        AppRoutes.register: (context) => RegisterPage()
      },
    );
  }
}


