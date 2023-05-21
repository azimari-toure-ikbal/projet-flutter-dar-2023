import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:projet_flutter_dar_2023/data/datasources/remote/api_service.dart';
import 'package:projet_flutter_dar_2023/data/models/meteo_model.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text("Test"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  FutureBuilder _body() {
    List<String> villes = ["Rennes", "Paris", "Nantes", "Bordeaux", "Lyon"];

    Future<List<MeteoModel>> getMeteoPourVilles() async {
      final apiService =
          ApiService(Dio(BaseOptions(contentType: "application/json")));
      List<MeteoModel> meteos = [];

      for (String ville in villes) {
        final meteo = await apiService.getMeteo(
            "b1d8f9447a9d4251824200816232005", ville, "no");
        meteos.add(meteo);
      }

      return meteos;
    }

    return FutureBuilder(
        future: getMeteoPourVilles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final List<MeteoModel> meteos = snapshot.data;
              return _posts(meteos);
            } else {
              print(snapshot.stackTrace);
              print(snapshot.error);
              return const Center(
                child: Text("Une erreur inconue est survenue !"),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  // Widget _posts(MeteoModel meteo) {
  //   return Center(
  //     child: Row(
  //       children: [
  //         Text("${meteo.location.name}, ${meteo.location.country}"),
  //         Text(meteo.current.condition.text),
  //         Text("${meteo.current.condition.code}"),
  //         Text("${meteo.current.temp_c}"),
  //         Text("${meteo.current.temp_f}"),
  //       ],
  //     ),
  //   );
  // }

  Widget _posts(List<MeteoModel> meteos) {
    return ListView.builder(
        itemCount: meteos.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black38,
                  width: 1,
                )),
            child: Column(
              children: [
                Text(
                    "${meteos[index].location.name} | ${meteos[index].location.country}"),
                const SizedBox(
                  height: 12,
                ),
                Text(
                    "${meteos[index].current.tempC} | ${meteos[index].current.condition.text}")
              ],
            ),
          );
        });
  }
}
