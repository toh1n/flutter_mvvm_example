import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_example/view/home_view.dart';
import 'package:flutter_mvvm_example/view/login_view.dart';
import 'package:flutter_mvvm_example/view/sign_up_view.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.home :
        return MaterialPageRoute(builder: (BuildContext context) => const HomeView());
      case RoutesName.login :
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());
      case RoutesName.signUp :
        return MaterialPageRoute(builder: (BuildContext context) => const SignUpView());

      default :
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(child: Text("Route Not Defines")),
          );
        });
    }
  }

}