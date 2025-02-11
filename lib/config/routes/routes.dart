import 'package:flutter/material.dart';
import 'package:oruphones/home/home_screen.dart';
import 'package:oruphones/registration/customer_name_screen.dart';
import 'package:oruphones/registration/login_screen.dart';
import 'package:oruphones/registration/verify_otp_screen.dart';
import 'package:oruphones/undefined_route.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const HomeScreen()); //SplashScreen
      case '/verifyotp':
        return _materialRoute(const VerifyOtpScreen());
      case '/customername':
        return _materialRoute(const CustomerNameScreen());
      case '/login':
        return _materialRoute(const LoginScreen());
      case '/homescreen':
        return _materialRoute(const HomeScreen());
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
