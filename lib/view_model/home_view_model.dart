import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_example/data/response/api_response.dart';
import 'package:flutter_mvvm_example/model/color_model.dart';
import 'package:flutter_mvvm_example/repository/home_repository.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<ColorModel> colorList = ApiResponse.loading();

  setMoviesList(ApiResponse<ColorModel> response) {
    colorList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    setMoviesList(ApiResponse.loading());

    _myRepo.fetchColorList().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}
