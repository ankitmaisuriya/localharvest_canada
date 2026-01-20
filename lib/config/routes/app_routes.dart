import 'package:flutter/material.dart';
import 'package:localharvest_canada/core/widgets/responsive_layout.dart';
import 'package:localharvest_canada/features/auth/presentation/pages/login_page.dart';
import 'package:localharvest_canada/features/auth/presentation/pages/register_page.dart';
import 'package:localharvest_canada/features/farm_details/presentation/pages/farm_details_page.dart';
import 'package:localharvest_canada/features/home/presentation/pages/home_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';

class AppRoutes {
  static const splash = "/";
  static const login = '/login';
  static const home = '/home';
  static const register = "/register";
  static const farmDetail = "/farmDetail";
  static const myOrder = "/myOrder";
  static const favorite = "/favorite";
  static const messages = "/messages";
  static const setting = "/settings";
  static const support = "/support";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());

      case register:
        return MaterialPageRoute(builder: (_) => RegisterPage());

      case home:
        return MaterialPageRoute(builder: (_) => HomePage());

      case myOrder:
        return MaterialPageRoute(
          builder: (context) => ResponsiveLayout(
            child: Scaffold(body: Center(child: Text('My Orders'))),
          ),
        );

      case favorite:
        return MaterialPageRoute(
          builder: (context) => ResponsiveLayout(
            child: Scaffold(body: Center(child: Text('My Favorite Farms'))),
          ),
        );
      case messages:
        return MaterialPageRoute(
          builder: (context) => ResponsiveLayout(
            child: Scaffold(body: Center(child: Text('My messages'))),
          ),
        );
      case setting:
        return MaterialPageRoute(
          builder: (context) => ResponsiveLayout(
            child: Scaffold(body: Center(child: Text('Settings'))),
          ),
        );
      case support:
        return MaterialPageRoute(
          builder: (context) => ResponsiveLayout(
            child: Scaffold(body: Center(child: Text('Supports'))),
          ),
        );

      case farmDetail:
        return MaterialPageRoute(builder: (context) => FarmDetailsPage(),);
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
