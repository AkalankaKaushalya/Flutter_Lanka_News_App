import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lanka_news_app/controller/splash_controller.dart';
import 'package:lanka_news_app/routers/router.dart';
import 'package:lanka_news_app/util/theme.dart';
import 'package:lanka_news_app/util/toast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initConnectivity();
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppRouter.home);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> initConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final hasInternet =
        (connectivityResult.contains(ConnectivityResult.mobile) ||
            connectivityResult.contains(ConnectivityResult.wifi));
    if (!hasInternet) {
      showToast('No Internet Connection');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (c) => Scaffold(
        backgroundColor: AppColors.backgroundLight,
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/newspaper.png',
                    width: 150,
                    height: 150,
                  ),
                  const Text(
                    'Lanka News App',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: LoadingAnimationWidget.waveDots(
                color: AppColors.primaryColor,
                size: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
