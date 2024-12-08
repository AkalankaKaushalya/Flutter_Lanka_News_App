import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lanka_news_app/model/news_model.dart';
import 'package:lanka_news_app/util/config.dart';
import 'package:lanka_news_app/views/splash_screen.dart';

class SearchNewsController extends GetxController {
  final searchController = TextEditingController();
  List<News> searchResults = [];
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        searchResults.clear();
        update();
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> searchNews() async {
    if (searchController.text.isEmpty) return;

    isLoading = true;
    update();

    try {
      final response = await http.get(
        Uri.parse(
            'https://newsapi.org/v2/everything?q=${searchController.text}&apiKey=${Config.token}&pageSize=20'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<dynamic> articles = data['articles'];

        // Filter out articles with the title [Removed]
        final filteredArticles = articles.where((article) {
          return article['title'] != "[Removed]";
        }).toList();

        searchResults =
            filteredArticles.map((article) => News.fromJson(article)).toList();
      }
    } catch (e) {
      print("Error searching news: $e");
    } finally {
      isLoading = false;
      update();
    }
  }
}
