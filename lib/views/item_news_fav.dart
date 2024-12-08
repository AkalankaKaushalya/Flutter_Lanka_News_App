import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_news_app/model/news_model.dart';
import 'package:global_news_app/routers/router.dart';
import 'package:global_news_app/util/helper.dart';

class ItemNewsFav extends StatelessWidget {
  final News news;
  const ItemNewsFav(this.news, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRouter.news_view, arguments: news),
      child: Card(
        margin: const EdgeInsets.fromLTRB(14, 8, 14, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // ignore: unnecessary_null_comparison
                news.urlToImage != null
                    ? CachedNetworkImage(
                        imageUrl: news.urlToImage,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ).clipRRect(
                        borderRadius: BorderRadius.circular(5),
                      )
                    : Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey,
                        child: const Center(
                          child: Icon(
                            Icons.error,
                            color: Colors.white,
                          ),
                        )),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.title.length > 50
                            ? '${news.title.substring(0, 50)}...'
                            : news.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.person,
                                  size: 24,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  news.author.length > 15
                                      ? '${news.author.substring(0, 15)}...'
                                      : news.author,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
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
                                  Helper.formatDate(news.publishedAt),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        // ignore: unnecessary_null_comparison
                        news.description != null
                            ? '${news.description.substring(0, 65)}...'
                            : '',
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
