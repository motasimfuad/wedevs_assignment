import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:motasimfuad_wedevs/src/core/theme/colors.dart';
import 'package:motasimfuad_wedevs/src/features/dashboard/controller/dashboard_view_controller.dart';
import 'package:motasimfuad_wedevs/src/features/products/view/products_screen.dart';
import 'package:motasimfuad_wedevs/src/features/profile/views/profile_screen.dart';
import 'package:motasimfuad_wedevs/src/utils/assets.dart';

class DashboardPage extends GetView<DashboardViewController> {
  const DashboardPage({Key? key}) : super(key: key);

  static final List<Widget> _children = [
    Center(
      child: Image.asset(
        Assets.logo,
        width: 140.w,
      ),
    ),
    const ProductsScreen(),
    Center(
      child: Image.asset(
        Assets.logo,
        width: 140.w,
      ),
    ),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PopScope(
        canPop: controller.currentIndex == 0,
        onPopInvoked: _onPopInvoked,
        child: Scaffold(
          extendBody: true,
          body: IndexedStack(
            index: controller.currentIndex,
            children: _children,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton:
              (MediaQuery.of(context).viewInsets.bottom != 0.0)
                  ? const Offstage()
                  : Container(
                      height: 56,
                      width: 56,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: AppColors.primaryGradient,
                        ),
                      ),
                      child: FloatingActionButton(
                        isExtended: true,
                        elevation: 0,
                        onPressed: () => controller.updateIndex(1),
                        backgroundColor: Colors.transparent,
                        highlightElevation: 0,
                        child: Image.asset(
                          Assets.search,
                          height: 24,
                        ),
                      ),
                    ),
          bottomNavigationBar: Obx(() {
            return Container(
              height: Platform.isAndroid ? 65 : null,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    spreadRadius: 0,
                    blurRadius: 12,
                    offset: const Offset(0, -8),
                  ),
                ],
              ),
              child: BottomAppBar(
                  shape: const CircularNotchedRectangle(),
                  notchMargin: 8,
                  elevation: 0,
                  color: Colors.white,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildIcon(
                        0,
                        asset: Assets.dashboardTab1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: _buildIcon(
                          1,
                          asset: Assets.dashboardTab2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: _buildIcon(
                          2,
                          asset: Assets.dashboardTab3,
                        ),
                      ),
                      _buildIcon(
                        3,
                        asset: Assets.dashboardTab4,
                      ),
                    ],
                  )),
            );
          }),
        ),
      );
    });
  }

  bool _onPopInvoked(bool isPop) {
    if (controller.currentIndex == 0) {
      return true;
    } else {
      controller.updateIndex(0);
      return false;
    }
  }

  Widget _buildIcon(
    int index, {
    required String asset,
  }) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      highlightColor: Colors.transparent,
      onPressed: () => controller.updateIndex(index),
      icon: Image.asset(
        asset,
        color: controller.currentIndex == index
            ? AppColors.primary
            : AppColors.secondary,
        height: 22,
        width: 22,
      ),
    );
  }
}
