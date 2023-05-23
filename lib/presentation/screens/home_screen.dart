import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:projet_flutter_dar_2023/presentation/controllers/meteo_screen_controller.dart';
import 'package:projet_flutter_dar_2023/presentation/widgets/home_screen_text.dart';

import '../../routes.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final HomeScreenController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.indigo.shade900,
              Colors.indigo.shade500,
              Colors.blue,
              Colors.lightBlueAccent,
              Colors.blue.shade100
            ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [HomeScreenText("DISCOVER")],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [HomeScreenText("THE WEATHER")],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [HomeScreenText("IN A NEW WAY")],
              ),
              Lottie.asset(
                "assets/lottie/weather.json",
              )
            ],
          ),
        ),
        Positioned(
          bottom: 30,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "Start",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.meteo);
                },
                child: const Icon(CupertinoIcons.arrow_right),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
