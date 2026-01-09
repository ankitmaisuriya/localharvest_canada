import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localharvest_canada/core/widgets/responsive_layout.dart';
import 'package:localharvest_canada/features/auth/domain/usecases/register_user.dart';
import 'package:localharvest_canada/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:localharvest_canada/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:localharvest_canada/features/auth/domain/usecases/login_user.dart';
import 'package:localharvest_canada/core/network/dio_client.dart';
import 'package:localharvest_canada/features/auth/presentation/pages/login_page.dart';
import 'package:localharvest_canada/features/auth/presentation/pages/register_page.dart';
import '../../features/auth/data/datasources/auth_remote_datasource_impl.dart';
import '../../features/auth/presentation/pages/splash_page.dart';

class AppRoutes {
  static const splash = "/";
  static const login = '/login';
  static const home = '/home';
  static const register = "/register";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());

      case register:
        return MaterialPageRoute(builder: (_) => RegisterPage());

      case home:
        return MaterialPageRoute(
          builder: (_) => ResponsiveLayout(child: const Scaffold(backgroundColor: Colors.green)),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
