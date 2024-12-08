import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_news_app/controller/view_news_category_controller.dart';
import 'package:global_news_app/model/category_model.dart';
import 'package:global_news_app/views/item_news.dart';

class ViewCategoryNews extends StatelessWidget {
  final Category? category;
  const ViewCategoryNews(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ViewNewsCategoryController>();

    // Set the news item in the controller
    if (category != null) {
      controller.setCategory(category!);
    }

    return GetBuilder<ViewNewsCategoryController>(
      builder: (c) {
        if (c.categoryItem == null) {
          return Scaffold(
            appBar: AppBar(
              title: Text('${c.categoryItem!.name} News List'),
            ),
            body: const Center(child: Text('No global news data available')),
          );
        }

        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Get.back(),
              ),
              title: Text('${c.categoryItem!.name} Full News List'),
              centerTitle: true,
            ),
            body: SafeArea(
              child: Column(
                children: [
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
            ));
      },
    );
  }
}
