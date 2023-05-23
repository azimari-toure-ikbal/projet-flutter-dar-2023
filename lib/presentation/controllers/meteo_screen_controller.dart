import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../data/datasources/remote/api_service.dart';

class MeteoScreenController extends GetxController {
  final List<String> villes = ["Rennes", "Paris", "Nantes", "Bordeaux", "Lyon"];
  final List<String> loadingMessages = [
    "Nous téléchargeons les données",
    "C'est presque fini",
    "Plus que quelques secondes avant d'avoir le résultat"
  ];
  late final Timer _loadingMessageTimer;

  final RxList _meteoResponse = [].obs;
  final RxBool _isLoading = true.obs;
  final RxString _loadingMessage = "".obs;

  List get meteoResponse => _meteoResponse.value;

  String get loadingMessage => _loadingMessage.value;

  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
    getMeteoPourVilles();
  }

  Future<void> getMeteoPourVilles() async {
    _isLoading.value = true;
    _meteoResponse.value = [];

    _loadingMessage.value = loadingMessages[0];
    _loadingMessageTimer =
        Timer.periodic(const Duration(seconds: 6), loadingMessageCallback);

    final apiService =
        ApiService(Dio(BaseOptions(contentType: "application/json")));
    int _counter = 0;
    const Duration duration = Duration(seconds: 10);

    Timer.periodic(duration, (timer) async {
      final meteo = await apiService.getMeteo(
          "b1d8f9447a9d4251824200816232005", villes[_counter], "no");

      _meteoResponse.add(meteo);

      print("here $_counter");

      _counter++;

      if (_counter == 5) {
        timer.cancel();
        Future.delayed(const Duration(seconds: 10), () {
          _isLoading.value = false;

          print("last iteration ${_isLoading.value}");
        });
      }
    });
  }

  void loadingMessageCallback(Timer timer) {
    _loadingMessage.value = loadingMessages[timer.tick % 3];
    if (!isLoading) {
      timer.cancel();
      _loadingMessage.value = "";
    }
  }
}
