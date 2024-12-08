import 'package:get/get.dart';
import 'package:global_news_app/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => HomeController(parser: Get.find()));
  }
}
