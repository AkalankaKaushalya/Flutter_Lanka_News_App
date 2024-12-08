import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_news_app/controller/home_controller.dart';
import 'package:global_news_app/routers/router.dart';
import 'package:global_news_app/views/item_category.dart';
import 'package:global_news_app/views/item_news.dart';

class TabNews extends StatelessWidget {
  TabNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (c) => Scaffold(
          appBar: AppBar(
            title: const Text('Global News', textAlign: TextAlign.center),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => Get.toNamed(AppRouter.search_news),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: c.categories.length,
                    itemBuilder: (context, index) {
                      final category = c.categories[index];
                      return GestureDetector(
                        onTap: () {
                          c.selectedCategory = category.name;
                          c.resetNewsList();
                          c.loadNews(category.name);
                          c.update();
                        },
                        child: ItemCategory(category.name, category.iconUrl,
                            c), // සොර්ට් කරල තියෙන්නෙ අපි මෙකට කියන්නෙ ui ඔප්ටිමයිසෙශන්
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    controller: c.scrollController,
                    itemCount: c.newsList.length + 1,
                    itemBuilder: (context, index) {
                      if (index == c.newsList.length) {
                        return c.isLoadingMore
                            ? const Center(child: CircularProgressIndicator())
                            : const SizedBox.shrink();
                      }
                      final news = c.newsList[index];
                      return ItemNews(
                          news); // සොර්ට් කරල තියෙන්නෙ අපි මෙකට කියන්නෙ ui ඔප්ටිමයිසෙශන්
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
