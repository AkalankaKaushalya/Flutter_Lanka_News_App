import 'package:get/get.dart';
import 'package:global_news_app/controller/view_news_controller.dart';

class ViewNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewNewsController());
  }
}
