import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm_example/model/user_model.dart';
import 'package:flutter_mvvm_example/repository/auth_repository.dart';
import 'package:flutter_mvvm_example/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_example/utils/utils.dart';
import 'package:flutter_mvvm_example/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setLoading(bool loadingStatus){
    _isLoading = loadingStatus;
    notifyListeners();

  }


  Future<dynamic> loginApi (dynamic data,BuildContext context) async{

    setLoading(true);

    _myRepo.loginApi(data).then((value){
      setLoading(false);

      final userPreference = Provider.of<UserViewModel>(context , listen: false);

      userPreference.saveUserData(
          UserModel(
              token: value['token'].toString()
          )
      );

      Navigator.pushNamedAndRemoveUntil(context, RoutesName.home,(route) => false);
      Utils.flushBarErrorMessage("Login Successfully", context);
      if(kDebugMode){
        print(data.toString());
      }

    }).onError((error, stackTrace){
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode){
        print(error.toString());
      }
    });
  }

  Future<dynamic> signUpApi (dynamic data,BuildContext context) async{

    setLoading(true);

    _myRepo.signUpApi(data).then((value){
      setLoading(false);
      Navigator.pop(context);
      Utils.flushBarErrorMessage("Signed up Successfully.Please Login", context);
      if(kDebugMode){
        print(data.toString());
      }
    }).onError((error, stackTrace){
      setLoading(false);
      Utils.flushBarErrorMessage("Sign up failed", context);
      if(kDebugMode){
        print(error.toString());
      }
    });
  }

}