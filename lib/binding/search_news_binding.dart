import 'package:get/get.dart';
import 'package:lanka_news_app/controller/search_news_controller.dart';

class SearchNewsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchNewsController());
  }
}
