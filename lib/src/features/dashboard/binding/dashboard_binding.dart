import 'package:get/get.dart';
import 'package:motasimfuad_wedevs/src/features/dashboard/controller/dashboard_view_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardViewController(), fenix: true);
  }
}
