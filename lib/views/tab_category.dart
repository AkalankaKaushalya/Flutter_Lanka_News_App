import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lanka_news_app/controller/home_controller.dart';
import 'package:lanka_news_app/routers/router.dart';
import 'package:lanka_news_app/util/toast.dart';

class TabCategory extends StatelessWidget {
  const TabCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (c) => Scaffold(
        appBar: AppBar(
          title: Text('Lanka News Category', textAlign: TextAlign.center),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.more_rounded),
            onPressed: () => showToast('Settings'),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: c.categories.length,
                itemBuilder: (context, index) {
                  final category = c.categories[index];
                  return GestureDetector(
                    onTap: () => Get.toNamed(AppRouter.news_category,
                        arguments: category),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                            imageUrl: category.iconUrl,
                            height: 50,
                            width: 50,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          Text(
                            category.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
