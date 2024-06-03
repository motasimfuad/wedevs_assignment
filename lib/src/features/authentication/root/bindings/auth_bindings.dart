import 'package:get/get.dart';
import 'package:motasimfuad_wedevs/src/features/authentication/sign_in/controllers/sign_in_view_controller.dart';
import 'package:motasimfuad_wedevs/src/features/authentication/sign_up/controllers/sign_up_view_controller.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInViewController(), fenix: true);
    Get.lazyPut(() => SignUpViewController(), fenix: true);
  }
}
