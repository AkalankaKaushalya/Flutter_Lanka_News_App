import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_news_app/controller/home_controller.dart';
import 'package:global_news_app/util/toast.dart';
import 'package:global_news_app/views/item_news_fav.dart';

class TabFavorite extends StatelessWidget {
  const TabFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (c) => Scaffold(
        appBar: AppBar(
          title: const Text('Our Favorite', textAlign: TextAlign.center),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => showToast('Settings'),
          ),
        ),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await c.loadFavoriteNews();
            },
            child: c.favoriteNews.isEmpty
                ? ListView(
                    children: const [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text('No favorite news available'),
                        ),
                      ),
                    ],
                  )
                : ListView.builder(
                    itemCount: c.favoriteNews.length,
                    itemBuilder: (context, index) {
                      final news = c.favoriteNews[index];
                      return ItemNewsFav(news);
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
