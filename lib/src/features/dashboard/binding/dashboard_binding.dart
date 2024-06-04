import 'package:get/get.dart';
import 'package:motasimfuad_wedevs/src/features/dashboard/controller/dashboard_view_controller.dart';
import 'package:motasimfuad_wedevs/src/features/products/controllers/products_view_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardViewController(), fenix: true);
    Get.lazyPut(() => ProductsViewController(), fenix: true);
  }
}
