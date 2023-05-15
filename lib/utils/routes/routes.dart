import 'package:flutter/material.dart';
import 'package:food_app/utils/routes/routes_name.dart';
import 'package:food_app/modules/home/home_screen.dart';
import 'package:food_app/modules/auth/auth_view/login_screen.dart';
import 'package:food_app/modules/auth/auth_view/signup_screen.dart';
import 'package:food_app/modules/splash/splash_screen.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: ((context) => const SpalshScreen()));
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: ((context) => const HomeScreen()));
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: ((context) => const LoginScreen()));
      case RouteName.signUpScreen:
        return MaterialPageRoute(builder: ((context) => const SignUpScreen()));
      default:
       return MaterialPageRoute(
          builder: ((context) {
            return const Scaffold(
              body: Center(
                child: Text("No routes found"),
              ),
            );
          }
        ),
       );
    }
  }
}
