import 'package:get/get.dart';
import 'package:global_news_app/db_helper/sql_helper.dart';
import 'package:global_news_app/model/news_model.dart';

class ViewNewsController extends GetxController {
  News? newsItem;
  bool isFavorite = false;

  @override
  void onInit() {
    super.onInit();
    checkHaveThisNewsIsFavorite();
  }

  void setNewsItem(News? news) {
    newsItem = news;
    update();
  }

  toggleFavorite() async {
    if (newsItem != null) {
      final db = await DatabaseHelper.instance.database;
      final List<Map<String, dynamic>> maps = await db
          .query('news_tb', where: 'title = ?', whereArgs: [newsItem!.title]);
      if (maps.isNotEmpty) {
        await db.delete('news_tb',
            where: 'title = ?', whereArgs: [newsItem!.title]);
      } else {
        await DatabaseHelper.instance.insertNote(
          News(
            title: newsItem!.title,
            description: newsItem!.description,
            urlToImage: newsItem!.urlToImage,
            author: newsItem!.author,
            publishedAt: newsItem!.publishedAt,
            content: newsItem!.content,
          ),
        );
      }
      checkHaveThisNewsIsFavorite();
      update();
    }
  }

  Future<void> checkHaveThisNewsIsFavorite() async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db
        .query('news_tb', where: 'title = ?', whereArgs: [newsItem?.title]);
    isFavorite = maps.isNotEmpty;
    update();
  }
}

class ViewNewsParser {}
