import 'package:get/get.dart';
import 'package:lanka_news_app/controller/home_controller.dart';
import 'package:lanka_news_app/controller/splash_controller.dart';

class MainBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => SplashParser());
    Get.lazyPut(() => HomeParser());
    /*Get.lazyPut(() => ViewNewsParser());*/
  }
}
