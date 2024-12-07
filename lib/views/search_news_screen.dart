import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lanka_news_app/controller/search_news_controller.dart';
import 'package:lanka_news_app/views/item_news.dart';

class SearchNewsScreen extends StatelessWidget {
  const SearchNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchNewsController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: controller.searchController,
            decoration: InputDecoration(
              hintText: 'Search news...',
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => controller.searchNews(),
              ),
            ),
            onSubmitted: (_) => controller.searchNews(),
          ),
        ),
        body: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : controller.searchResults.isEmpty
                ? const Center(
                    child: Text('No results found'),
                  )
                : ListView.builder(
                    itemCount: controller.searchResults.length,
                    itemBuilder: (context, index) {
                      return ItemNews(controller.searchResults[index]);
                    },
                  ),
      ),
    );
  }
}
