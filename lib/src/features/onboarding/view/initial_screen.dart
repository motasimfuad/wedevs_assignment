import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motasimfuad_wedevs/src/core/cache/cache_service.dart';
import 'package:motasimfuad_wedevs/src/routes/app_pages.dart';
import 'package:motasimfuad_wedevs/src/utils/assets.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();

    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      if (CacheService().getToken() != null) {
        return Get.offAllNamed(Routes.dashboard);
      }
      return Get.offAllNamed(Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 25),
          width: 290,
          child: Image.asset(
            Assets.splashLogo,
            alignment: Alignment.center,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
