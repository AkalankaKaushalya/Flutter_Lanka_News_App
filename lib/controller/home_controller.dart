import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lanka_news_app/db_helper/sql_helper.dart';
import 'package:lanka_news_app/model/category_model.dart';
import 'package:lanka_news_app/model/news_model.dart';
import 'package:lanka_news_app/util/config.dart';
import 'package:lanka_news_app/views/tab_category.dart';
import 'package:lanka_news_app/views/tab_favorite.dart';
import 'package:lanka_news_app/views/tab_news.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController implements GetxService {
  final HomeParser parser;
  int selectedIndex = 0;
  int currentPageIndex = 0;

  final List<Category> categories = [
    Category(
        name: "all",
        iconUrl: "https://cdn-icons-png.flaticon.com/128/9356/9356448.png"),
    Category(
        name: "business",
        iconUrl: "https://cdn-icons-png.flaticon.com/128/9356/9356507.png"),
    Category(
        name: "entertainment",
        iconUrl: "https://cdn-icons-png.flaticon.com/128/9356/9356578.png"),
    Category(
        name: "health",
        iconUrl: "https://cdn-icons-png.flaticon.com/128/9356/9356593.png"),
    Category(
        name: "science",
        iconUrl: "https://cdn-icons-png.flaticon.com/128/9356/9356621.png"),
    Category(
        name: "sports",
        iconUrl: "https://cdn-icons-png.flaticon.com/128/9356/9356642.png"),
    Category(
        name: "technology",
        iconUrl: "https://cdn-icons-png.flaticon.com/128/9356/9356667.png"),
  ];
  String selectedCategory = 'all';

  List<News> newsList = [];
  bool isLoadingMore = false;
  int currentPage = 1;

  List<News> favoriteNews = [];
  bool isLoadingFavoriteNews = false;
  int currentPageFavoriteNews = 1;

  List<Widget> buildScreens() {
    return [TabNews(), const TabCategory(), const TabFavorite()];
  }

  ScrollController scrollController = ScrollController();
  HomeController({required this.parser});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadNews(selectedCategory);
    loadFavoriteNews();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        if (!isLoadingMore) {
          loadNews(selectedCategory);
        }
      }
    });
  }

  void onItemTapped(int index) {
    selectedIndex = index;
    loadFavoriteNews();
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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

    selectedCategory = category;
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
        log("Error: ${response.statusCode}");
      }
    } catch (e) {
      log("Error: $e");
    } finally {
      isLoadingMore = false;
      update();
    }
  }

  Future<void> loadFavoriteNews() async {
    isLoadingFavoriteNews = true;
    update();

    try {
      final db = await DatabaseHelper.instance.database;
      final List<Map<String, dynamic>> maps = await db.query('news_tb');
      if (maps.isNotEmpty) {
        favoriteNews = maps.map((map) => News.fromMapp(map)).toList();
      } else {
        favoriteNews = <News>[];
      }
    } on Exception catch (e) {
      log("Error: $e");
      favoriteNews = <News>[];
    } finally {
      isLoadingFavoriteNews = false;
      update();
    }
  }
}

class HomeParser {}
