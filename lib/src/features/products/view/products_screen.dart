import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motasimfuad_wedevs/src/core/cache/cache_service.dart';
import 'package:motasimfuad_wedevs/src/routes/app_pages.dart';
import 'package:motasimfuad_wedevs/src/widgets/primary_button.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Products Screen'),
            PrimaryButton(
              title: 'Sign Out',
              onTap: () {
                CacheService().clear();
                Get.offAllNamed(Routes.initial);
              },
            ),
          ],
        ),
      ),
    );
  }
}
