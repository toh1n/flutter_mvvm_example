import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/model/user_model.dart';
import 'package:flutter_mvvm_example/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_example/view_model/user_view_model.dart';

class SplashService{


  Future<UserModel> _getUserData()  async => UserViewModel().getUser();

  void checkAuthentication (BuildContext context) async {
    _getUserData().then((value)async{
      if(kDebugMode){
        print(value.token.toString());
      }
      if(value.token.toString() == 'null' || value.token.toString() == ''){

        await Future.delayed(const Duration(seconds: 3)).then((value){
          Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false);
        });
      } else{
        await Future.delayed(const Duration(seconds: 3)).then((value){
          Navigator.pushNamedAndRemoveUntil(context, RoutesName.home, (route) => false);
        });
      }
    });
  }


}
