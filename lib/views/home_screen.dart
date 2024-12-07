import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lanka_news_app/controller/home_controller.dart';
import 'package:lanka_news_app/util/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (c) => Scaffold(
        backgroundColor: AppColors.backgroundLight,
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              c.currentPageIndex = index;
              //showToast('${c.selectedIndex}');
            });
          },
          indicatorColor: AppColors.primaryColor,
          selectedIndex: c.currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'News',
            ),
            NavigationDestination(
              icon: Icon(Icons.category_outlined),
              label: 'Category',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_border_outlined),
              label: 'Favorite',
            ),
          ],
        ),
        body: c.buildScreens()[c.currentPageIndex],
      ),
    );
  }
}
