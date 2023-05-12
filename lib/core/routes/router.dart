import 'package:flutter/material.dart';
import 'package:politicaltermins/view/pages/home_page.dart';
import 'package:politicaltermins/view/screens/splash_screen.dart';

class RouteGenerator {
  static final RouteGenerator _generator = RouteGenerator._init();

  static RouteGenerator get router => _generator;

  RouteGenerator._init();

  Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _navigate(const HomePage());
      case 'splash':
        return _navigate(const SplashScreen());
    }
    return null;
  }

  // AVOID REPEATING . . .
  MaterialPageRoute _navigate(Widget page) {
    return MaterialPageRoute(
      builder: (context) => page,
    );
  }
}
