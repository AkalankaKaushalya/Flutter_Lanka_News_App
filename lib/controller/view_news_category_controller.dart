import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_news_app/model/category_model.dart';
import 'package:global_news_app/model/news_model.dart';
import 'package:global_news_app/util/config.dart';
import 'package:http/http.dart' as http;

class ViewNewsCategoryController extends GetxController {
  Category? categoryItem;

  List<News> newsList = [];
  bool isLoadingMore = false;
  int currentPage = 1;

  ScrollController scrollController = ScrollController();
  ViewNewsCategoryController({this.categoryItem});

  void setCategory(Category categoryModel) {
    categoryItem = categoryModel;
    if (categoryItem != null) {
      loadNews(categoryItem!.name);
      scrollController.addListener(() {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200) {
          if (!isLoadingMore && categoryItem != null) {
            loadNews(categoryItem!.name);
          }
        }
      });
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void resetNewsList() {
    newsList.clear();
    currentPage = 1;

    update();
  }

  Future<void> loadNews(String category) async {
    if (isLoadingMore) return;
    isLoadingMore = true;
    update();

    String url = category == "all"
        ? "https://newsapi.org/v2/top-headlines?country=us&apiKey=${Config.token}&page=$currentPage&pageSize=10"
        : "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=${Config.token}&page=$currentPage&pageSize=10";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        List<dynamic> articles = data['articles'];

        // Filter out articles with the title `[Removed]`
        final filteredArticles = articles.where((article) {
          return article['title'] != "[Removed]";
        }).toList();

        // Convert filtered articles to News objects
        List<News> newNews =
            filteredArticles.map((article) => News.fromJson(article)).toList();

        newsList.addAll(newNews);
        currentPage++;
      } else {
        //log("Error: ${response.statusCode}");
      }
    } catch (e) {
      //log("Error: $e");
    } finally {
      isLoadingMore = false;
      update();
    }
  }
}

class ViewNewsCategoryParser {}
