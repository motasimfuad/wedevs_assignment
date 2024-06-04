import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:motasimfuad_wedevs/src/core/theme/colors.dart';
import 'package:motasimfuad_wedevs/src/features/products/controllers/products_view_controller.dart';
import 'package:motasimfuad_wedevs/src/features/products/widgets/product_card.dart';
import 'package:motasimfuad_wedevs/src/utils/assets.dart';
import 'package:motasimfuad_wedevs/src/widgets/primary_button.dart';

part '../widgets/filters_bottom_sheet.dart';
part '../widgets/products_filter.dart';

class ProductsScreen extends GetView<ProductsViewController> {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16.w),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(
          top: 10.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ProductsFilter(),
            Obx(
              () => Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 13.w,
                    mainAxisSpacing: 13.w,
                  ),
                  padding: EdgeInsets.only(
                    top: 10.h,
                    bottom: 100.h,
                  ),
                  itemCount: controller.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = controller.products[index];

                    return ProductCard(product: product);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
