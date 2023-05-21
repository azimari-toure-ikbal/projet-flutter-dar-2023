//
import 'package:get/get.dart';
import 'package:projet_flutter_dar_2023/presentation/screens/flemme.dart';
import 'package:projet_flutter_dar_2023/presentation/screens/home_screen.dart';
import 'package:projet_flutter_dar_2023/presentation/screens/meteo_screen.dart';
import 'package:projet_flutter_dar_2023/presentation/screens/test_screen.dart';

class AppRoutes {
  static const String home = "/";
  static const String meteo = "/meteo";
  static const String test = "/test";
  static const String flemme = "/flemme";

  static List<GetPage> get routes => [
        GetPage(name: home, page: () => const HomeScreen()),
        GetPage(name: meteo, page: () => const MetoScreen()),
        GetPage(name: test, page: () => const TestScreen()),
        GetPage(name: flemme, page: () => const FlemmeScreen()),
      ];
}
