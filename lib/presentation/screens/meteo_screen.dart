import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../controllers/meteo_screen_controller.dart';

class MetoScreen extends StatefulWidget {
  const MetoScreen({Key? key}) : super(key: key);

  @override
  State<MetoScreen> createState() => _MetoScreenState();
}

class _MetoScreenState extends State<MetoScreen> {
  @override
  Widget build(BuildContext context) {
    MeteoScreenController controller = Get.find();

    List meteos = [];

    if (controller.isLoading) {
      meteos = controller.meteoResponse;
    }

    return Obx(
      () => controller.isLoading
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
              child: Column(
                children: [
                  const Spacer(),
                  LinearPercentIndicator(
                    animation: true,
                    animationDuration: 60000,
                    lineHeight: 40,
                    percent: 1,
                    progressColor: Colors.deepPurple,
                    backgroundColor: Colors.deepPurple.shade200,
                    barRadius: const Radius.circular(35),
                  )
                ],
              ),
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
