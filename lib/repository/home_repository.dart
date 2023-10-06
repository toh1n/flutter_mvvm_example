import 'package:flutter_mvvm_example/data/network/base_api_services.dart';
import 'package:flutter_mvvm_example/data/network/network_api_services.dart';
import 'package:flutter_mvvm_example/model/color_model.dart';
import 'package:flutter_mvvm_example/res/app_url.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<ColorModel> fetchColorList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.colorModelUrl);
      return response = ColorModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
