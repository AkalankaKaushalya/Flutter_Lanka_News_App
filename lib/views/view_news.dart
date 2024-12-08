import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_news_app/model/news_model.dart';
import 'package:global_news_app/controller/view_news_controller.dart';
import 'package:global_news_app/util/helper.dart';

class ViewNews extends StatelessWidget {
  final News? news;
  const ViewNews(this.news, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ViewNewsController>();

    // Set the news item in the controller
    if (news != null) {
      controller.setNewsItem(news);
    }

    return GetBuilder<ViewNewsController>(
      builder: (controller) {
        if (controller.newsItem == null) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('News View'),
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
            title: const Text('News Full'),
            centerTitle: true,
            actions: [
              IconButton(
                icon: controller.isFavorite
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border),
                onPressed: () => controller.toggleFavorite(),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: controller.newsItem!.urlToImage,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ).clipRRect(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    controller.newsItem!.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.person,
                            size: 24,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            controller.newsItem!.author.length > 15
                                ? '${controller.newsItem!.author.substring(0, 15)}...'
                                : controller.newsItem!.author,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            Helper.formatDate(controller.newsItem!.publishedAt),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    controller.newsItem!.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

extension on CachedNetworkImage {
  clipRRect({required BorderRadius borderRadius}) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: this,
    );
  }
}
