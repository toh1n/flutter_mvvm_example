import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/res/components/round_button.dart';
import 'package:flutter_mvvm_example/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_example/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Home Screen"),
            RoundButton(title: 'Log Out', onTap: (){
              userPreferences.remove().then((value) {
                if(value){
                  Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false);
                }
              });
            },),
          ],
        ),
      ),
    );
  }
}
