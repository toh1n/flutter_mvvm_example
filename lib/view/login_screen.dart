import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/utils/routes/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Login Screen"),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, RoutesName.home);
            }, child: const Text("click"))
          ],
        ),
      ),
    );
  }
}
