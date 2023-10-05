import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/utils/routes/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Home Screen"),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, RoutesName.login);
            }, child: const Text("click"))
          ],
        ),
      ),
    );
  }
}
