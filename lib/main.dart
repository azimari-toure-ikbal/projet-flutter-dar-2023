import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projet_flutter_dar_2023/presentation/bindings/app_bindings.dart';
import 'package:projet_flutter_dar_2023/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My app",
      initialRoute: AppRoutes.home,
      initialBinding: AppBindings(),
      getPages: AppRoutes.routes,
    );
  }
}
