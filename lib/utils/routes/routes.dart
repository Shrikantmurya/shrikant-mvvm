

import 'package:flutter/material.dart';
import '../../view/signp_view.dart';
import '/utils/routes/routes_name.dart';
import '/view/layout.dart';
import '/view/login_view.dart';
import '/view/splash_view.dart';

class Routes {

  static Route<dynamic>  generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashView());

      case RoutesName.layout:
        return MaterialPageRoute(builder: (BuildContext context) => const Layout(selectedIndex: 0,));

      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (BuildContext context) => const SignUpView());

      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });

    }
  }
}