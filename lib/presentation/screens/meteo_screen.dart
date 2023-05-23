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

    // List controller.meteoResponse = [];
    //
    // if (controller.isLoading) {
    //   controller.meteoResponse = controller.meteoResponse;
    // }

    return Obx(
      () => controller.isLoading
          ? Scaffold(
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
                child: Column(
                  children: [
                    const Spacer(),
                    Text(
                      controller.loadingMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    const Spacer(),
                    LinearPercentIndicator(
                      animation: true,
                      animationDuration: 60000,
                      lineHeight: 40,
                      percent: 1,
                      progressColor: Colors.blue.shade600,
                      backgroundColor: Colors.blue.shade200,
                      barRadius: const Radius.circular(35),
                    )
                  ],
                ),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                  backgroundColor: Colors.blue.withOpacity(0.8),
                  elevation: 0,
                  leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(CupertinoIcons.arrow_left))),
              body: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.indigo.shade900,
                      Colors.indigo.shade500,
                      Colors.blue,
                      Colors.lightBlueAccent,
                      Colors.blue.shade100
                    ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
                    child: ListView.separated(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      itemCount: controller.meteoResponse.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 100,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${controller.meteoResponse[index].location.name}, ${controller.meteoResponse[index].location.country}",
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "${controller.meteoResponse[index].current.condition.code}",
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Text(
                                "${controller.meteoResponse[index].current.tempC.toString().replaceAll(".0", "")}°C",
                                style: const TextStyle(
                                    fontSize: 52,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                              // const Icon(
                              //   CupertinoIcons.cloud_bolt_rain_fill,
                              //   size: 50,
                              // )
                              Image.network(
                                  "https://cdn.weatherapi.com/weather/64x64/day/113.png")
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: MediaQuery.of(context).size.width / 2 - 50,
                    child: ElevatedButton(
                        onPressed: () {
                          controller.getMeteoPourVilles();
                        },
                        child: const Text("Recommencer")),
                  )
                ],
              ),
            ),
    );
  }
}
