import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_news_app/controller/home_controller.dart';
import 'package:global_news_app/util/theme.dart';

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
          backgroundColor: const Color.fromARGB(255, 187, 252, 156),
          onDestinationSelected: (int index) {
            setState(() {
              c.currentPageIndex = index;
              //showToast('${c.selectedIndex}');
            });
          },
          indicatorColor: const Color.fromARGB(255, 102, 247, 45),
          selectedIndex: c.currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.newspaper_sharp),
              icon: Icon(Icons.home_outlined),
              label: 'Global News',
            ),
            NavigationDestination(
              icon: Icon(Icons.category_outlined),
              label: 'Category News',
            ),
            NavigationDestination(
              icon: Icon(Icons.read_more_sharp),
              label: 'Reading List',
            ),
          ],
        ),
        body: c.buildScreens()[c.currentPageIndex],
      ),
    );
  }
}
