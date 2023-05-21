import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:projet_flutter_dar_2023/data/models/meteo_model.dart';

import '../../data/datasources/remote/api_service.dart';

class MeteoScreenController extends GetxController {
  List<String> villes = ["Rennes", "Paris", "Nantes", "Bordeaux", "Lyon"];
  final RxList _meteoResponse = [].obs;
  final RxBool _isLoading = true.obs;

  List get meteoResponse => _meteoResponse.value;

  bool get isLoading => _isLoading.value;

  List getMeteoPourVilles() {
    _isLoading.value = true;
    _meteoResponse.value = [];

    final apiService =
        ApiService(Dio(BaseOptions(contentType: "application/json")));
    int _counter = 0;
    const Duration duration = Duration(seconds: 10);
    Duration total = Duration(seconds: 0);

    Timer.periodic(duration, (timer) async {
      final meteo = await apiService.getMeteo(
          "b1d8f9447a9d4251824200816232005", villes[_counter], "no");

      _meteoResponse.add(meteo);

      print("here $_counter");
      print("duration here: ${total += duration}");

      _counter++;

      if (_counter == 5) {
        Future.delayed(duration, () {
          timer.cancel();
          _isLoading.value = false;

          print("last counter here $_counter");
          print("last duration here: ${total += duration}");
          print("last iteration ${_isLoading.value}");
        });
      }
    });
    return meteoResponse;
  }
}
