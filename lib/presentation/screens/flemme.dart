import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projet_flutter_dar_2023/data/models/meteo_model.dart';
import 'package:projet_flutter_dar_2023/presentation/controllers/meteo_screen_controller.dart';

class FlemmeScreen extends StatelessWidget {
  const FlemmeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MeteoScreenController controller = Get.find();

    List meteos = [];

    if (controller.isLoading) {
      meteos = controller.meteoResponse;
    }

    return Obx(
      () => controller.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black38,
                        width: 1,
                      )),
                  child: ListView.builder(
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
                      })),
            ),
    );
  }
}
