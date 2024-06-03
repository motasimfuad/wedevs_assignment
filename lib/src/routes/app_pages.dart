import 'package:get/get.dart';
import 'package:motasimfuad_wedevs/src/features/authentication/root/bindings/auth_bindings.dart';
import 'package:motasimfuad_wedevs/src/features/authentication/sign_in/views/sign_in_screen.dart';
import 'package:motasimfuad_wedevs/src/features/authentication/sign_up/views/sign_up_screen.dart';
import 'package:motasimfuad_wedevs/src/features/onboarding/view/initial_screen.dart';
import 'package:motasimfuad_wedevs/src/features/products/view/products_screen.dart';

part './app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.initial,
      page: () => const InitialScreen(),
    ),
    GetPage(
      name: Routes.login,
      page: () => SignInScreen(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: Routes.products,
      page: () => const ProductsScreen(),
    ),
  ];
}
