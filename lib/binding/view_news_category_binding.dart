import 'package:get/get.dart';
import 'package:global_news_app/controller/view_news_category_controller.dart';

class ViewNewsCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewNewsCategoryController());
  }
}
