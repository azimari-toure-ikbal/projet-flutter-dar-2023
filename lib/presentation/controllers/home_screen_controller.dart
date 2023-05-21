import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final RxBool _hasVisitedPage = false.obs;

  bool get hasvisitedPage => _hasVisitedPage.value;

  void markVisited() {
    _hasVisitedPage.value = true;
  }
}
