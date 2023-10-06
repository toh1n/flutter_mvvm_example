import 'package:flutter_mvvm_example/data/network/base_api_services.dart';
import 'package:flutter_mvvm_example/data/network/network_api_services.dart';
import 'package:flutter_mvvm_example/res/app_url.dart';

class AuthRepository{
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data)async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e){
      rethrow;
    }
  }

  Future<dynamic> signUpApi(dynamic data)async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerUrl, data);
      return response;
    } catch (e){
      rethrow;
    }
  }

}