import 'package:get/get.dart';
import 'package:lanka_news_app/binding/home_binding.dart';
import 'package:lanka_news_app/binding/search_news_binding.dart';
import 'package:lanka_news_app/binding/splash_binding.dart';
import 'package:lanka_news_app/binding/view_news_binding.dart';
import 'package:lanka_news_app/binding/view_news_category_binding.dart';
import 'package:lanka_news_app/views/home_screen.dart';
import 'package:lanka_news_app/views/search_news_screen.dart';
import 'package:lanka_news_app/views/splash_screen.dart';
import 'package:lanka_news_app/views/view_category_news.dart';
import 'package:lanka_news_app/views/view_news.dart';

class AppRouter {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String news_view = '/news';
  static const String news_category = '/news_category';
  static const String search_news = '/search_news';

  static String getInitialRoute() => splash;
  static String getHomeRoute() => home;
  static String getNewsViewRoute() => news_view;
  static String getNewsCategoryRoute() => news_category;
  static String getSearchNewsRoute() => search_news;

  static List<GetPage> routes = [
    GetPage(
        name: splash,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(name: home, page: () => const HomeScreen(), binding: HomeBinding()),
    GetPage(
        name: news_view,
        page: () => ViewNews(Get.arguments),
        binding: ViewNewsBinding()),
    GetPage(
        name: news_category,
        page: () => ViewCategoryNews(Get.arguments),
        binding: ViewNewsCategoryBinding()),
    GetPage(
        name: search_news,
        page: () => const SearchNewsScreen(),
        binding: SearchNewsBinding()),
  ];
}
