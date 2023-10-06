import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/utils/routes/routes_name.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
