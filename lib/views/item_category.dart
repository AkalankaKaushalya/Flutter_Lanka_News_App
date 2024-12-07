import 'package:flutter/material.dart';
import 'package:lanka_news_app/controller/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ItemCategory extends StatelessWidget {
  final String category;
  final String iconUrl;
  final HomeController c;
  ItemCategory(this.category, this.iconUrl, this.c);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      decoration: BoxDecoration(
        color: c.selectedCategory == category ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: iconUrl,
            height: 20,
            width: 20,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(width: 5),
          Text(
            category.toUpperCase(),
            style: TextStyle(
                color: c.selectedCategory == category
                    ? Colors.white
                    : Colors.black),
          ),
        ],
      )),
    );
  }
}
