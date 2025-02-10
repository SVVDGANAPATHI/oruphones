import 'package:flutter/material.dart';
import 'package:oruphones/login/login_page.dart';
import 'package:oruphones/splashscreen/splash_screen.dart';
import 'package:oruphones/undefined_route.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const SplashScreen());
      // case '/onboarding':
      //   return _materialRoute(const OnBoardingScreen());
      // case '/HomeScreen':
      //   return _materialRoute(const HomeScreen());
      case '/login':
        return _materialRoute(const LoginPage());
      // case '/SignUp':
      //   return _materialRoute(const SignUpScreen());
      // case '/dashboard':
      //   return _materialRoute(const DashBoard());

      // case '/notifications':
      //   return _materialRoute(const NotificationsPage());

      default:
        return _materialRoute(
          UndefinedRouteScreen(
            routeName: settings.name ?? 'Unknown',
          ),
        );
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
