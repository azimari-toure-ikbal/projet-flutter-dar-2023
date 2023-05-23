import 'package:get/get.dart';
import 'package:projet_flutter_dar_2023/presentation/controllers/home_screen_controller.dart';
import 'package:projet_flutter_dar_2023/presentation/controllers/meteo_screen_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
    Get.put(MeteoScreenController());
    // Get.lazyPut(() => MeteoScreenController());
  }
}
