import 'package:bringle/routes/register_confirmation.dart';
import 'package:flutter/material.dart';

import 'routes/dashboard_page.dart';
import 'routes/login_page.dart';
import 'routes/register_page.dart';

class RouteGenerator {
  static const String loginPage = '/';
  static const String registerPage = '/register';
  static const String dashboardPage = '/dashboard';
  static const String registerConfirmation = '/registered';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );

      case registerPage:
        return MaterialPageRoute(
          builder: (_) => const RegisterPage(),
        );

      case dashboardPage:
        return MaterialPageRoute(
          builder: (_) => const DashboardPage(),
        );

      case registerConfirmation:
        return MaterialPageRoute(
          builder: (_) => const RegisterConfirmation(),
        );

      default:
        throw FormatException('Rotute not found!');
    }
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
