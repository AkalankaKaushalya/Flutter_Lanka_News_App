import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_news_app/model/news_model.dart';
import 'package:global_news_app/routers/router.dart';
import 'package:global_news_app/util/helper.dart';

class ItemNews extends StatelessWidget {
  final News news;
  const ItemNews(this.news, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRouter.news_view, arguments: news),
      child: Card(
        margin: const EdgeInsets.fromLTRB(14, 8, 14, 8),
        child: Column(
          children: [
            // ignore: unnecessary_null_comparison
            news.urlToImage != null
                ? CachedNetworkImage(
                    imageUrl: news.urlToImage,
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
                  )
                : Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey,
                    child: const Center(
                      child: Icon(
                        Icons.error,
                        color: Colors.white,
                      ),
                    )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                news.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                        Helper.formatDate(news.publishedAt),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
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
