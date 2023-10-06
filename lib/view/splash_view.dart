import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashService auth = SplashService();

  @override
  void initState() {
    super.initState();

    auth.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Splash Screen",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
